#!/usr/bin/env bash
# tests/run.sh — Automated test runner for Agent hook scripts
#
# Usage: ./tests/run.sh [filter]
#   filter — optional substring to match test names (e.g. "validation" or "forgetting")
#
# Clones the Agent directory to a unique temp dir, creates a mock claude binary,
# runs all test functions, and reports pass/fail counts.

set -euo pipefail

# ─── Constants ────────────────────────────────────────────────────────────────

AGENT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TEST_DIR="$(mktemp -d /tmp/Agent-test.XXXXXX)"
MOCK_BIN="${TEST_DIR}-bin"
MOCK_BREADCRUMB="${TEST_DIR}-claude-invoked"
FILTER="${1:-}"

PASS=0
FAIL=0
SKIP=0
CURRENT_TEST=""

# ─── Colors ───────────────────────────────────────────────────────────────────

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BOLD='\033[1m'
RESET='\033[0m'

# ─── Setup / Teardown ────────────────────────────────────────────────────────

setup_suite() {
  rm -rf "$TEST_DIR" "$MOCK_BIN"
  cp -r "$AGENT_DIR" "$TEST_DIR"
  mkdir -p "$TEST_DIR/runtime"
  touch "$TEST_DIR/runtime/hook-test01.log"
  touch "$TEST_DIR/runtime/recalled-test01"

  # Create mock claude binary — consumes stdin, writes breadcrumb, exits 0
  mkdir -p "$MOCK_BIN"
  cat > "$MOCK_BIN/claude" << MOCK
#!/usr/bin/env bash
cat > /dev/null
echo "\$@" > $MOCK_BREADCRUMB
echo "mock-claude-response"
exit 0
MOCK
  chmod +x "$MOCK_BIN/claude"
}

teardown_suite() {
  rm -rf "$TEST_DIR" "$MOCK_BIN" "$MOCK_BREADCRUMB"
}

# Reset state before each test
reset_state() {
  > "$TEST_DIR/runtime/hook-test01.log"
  rm -f "$TEST_DIR/runtime/last-validation-session"
  rm -f "$TEST_DIR/runtime/last-forgetting-session"
  rm -f "$MOCK_BREADCRUMB"
  # Restore toggle defaults
  cat > "$TEST_DIR/agent.conf" << 'EOF'
## Agent hook toggles
## Set to "off" to disable, anything else (or absent) to enable

MEMORY_RECALL=on
MEMORY_UPDATE=off
MEMORY_FORGETTING=on
MEMORY_VALIDATION=on

## Schedules (offset/cycle — fires when session % cycle == offset)
MEMORY_FORGETTING_SCHEDULE=0/200
MEMORY_VALIDATION_SCHEDULE=75/100
EOF
}

# ─── Helpers ──────────────────────────────────────────────────────────────────

run_hook() {
  local hook="$1"
  shift
  echo '{}' | \
    PATH="$MOCK_BIN:$PATH" \
    CLAUDE_PROJECT_DIR="$TEST_DIR" \
    AGENT_HOOK_ID="test01" \
    AGENT_TERMINAL_PID="" \
    "$@" \
    bash "$TEST_DIR/src/hooks/$hook" 2>/dev/null
  return 0
}

get_log() {
  cat "$TEST_DIR/runtime/hook-test01.log"
}

# ─── Assertions ───────────────────────────────────────────────────────────────

assert_log_contains() {
  local pattern="$1" name="$2"
  local log
  log=$(get_log)
  if echo "$log" | grep -qF "$pattern"; then
    echo -e "  ${GREEN}PASS${RESET}  $name"
    PASS=$((PASS + 1))
  else
    echo -e "  ${RED}FAIL${RESET}  $name"
    echo "        expected log to contain: $pattern"
    echo "        actual log: $(echo "$log" | tail -5)"
    FAIL=$((FAIL + 1))
  fi
}

assert_log_not_contains() {
  local pattern="$1" name="$2"
  local log
  log=$(get_log)
  if echo "$log" | grep -qF "$pattern"; then
    echo -e "  ${RED}FAIL${RESET}  $name"
    echo "        expected log NOT to contain: $pattern"
    FAIL=$((FAIL + 1))
  else
    echo -e "  ${GREEN}PASS${RESET}  $name"
    PASS=$((PASS + 1))
  fi
}

assert_file_content() {
  local file="$1" expected="$2" name="$3"
  if [[ -f "$file" ]] && [[ "$(cat "$file")" == "$expected" ]]; then
    echo -e "  ${GREEN}PASS${RESET}  $name"
    PASS=$((PASS + 1))
  else
    echo -e "  ${RED}FAIL${RESET}  $name"
    echo "        expected: $expected"
    echo "        actual: $(cat "$file" 2>/dev/null || echo '<file missing>')"
    FAIL=$((FAIL + 1))
  fi
}

assert_file_exists() {
  local file="$1" name="$2"
  if [[ -f "$file" ]]; then
    echo -e "  ${GREEN}PASS${RESET}  $name"
    PASS=$((PASS + 1))
  else
    echo -e "  ${RED}FAIL${RESET}  $name"
    echo "        file does not exist: $file"
    FAIL=$((FAIL + 1))
  fi
}

assert_file_not_exists() {
  local file="$1" name="$2"
  if [[ ! -f "$file" ]]; then
    echo -e "  ${GREEN}PASS${RESET}  $name"
    PASS=$((PASS + 1))
  else
    echo -e "  ${RED}FAIL${RESET}  $name"
    echo "        file should not exist: $file"
    FAIL=$((FAIL + 1))
  fi
}

assert_claude_invoked() {
  local name="$1"
  if [[ -f "$MOCK_BREADCRUMB" ]]; then
    echo -e "  ${GREEN}PASS${RESET}  $name"
    PASS=$((PASS + 1))
  else
    echo -e "  ${RED}FAIL${RESET}  $name"
    echo "        mock claude was not invoked"
    FAIL=$((FAIL + 1))
  fi
}

assert_claude_not_invoked() {
  local name="$1"
  if [[ ! -f "$MOCK_BREADCRUMB" ]]; then
    echo -e "  ${GREEN}PASS${RESET}  $name"
    PASS=$((PASS + 1))
  else
    echo -e "  ${RED}FAIL${RESET}  $name"
    echo "        mock claude should not have been invoked"
    FAIL=$((FAIL + 1))
  fi
}

assert_exit_code() {
  local actual="$1" expected="$2" name="$3"
  if [[ "$actual" -eq "$expected" ]]; then
    echo -e "  ${GREEN}PASS${RESET}  $name"
    PASS=$((PASS + 1))
  else
    echo -e "  ${RED}FAIL${RESET}  $name"
    echo "        expected exit code: $expected"
    echo "        actual exit code: $actual"
    FAIL=$((FAIL + 1))
  fi
}

assert_output_contains() {
  local output="$1" pattern="$2" name="$3"
  if echo "$output" | grep -qF "$pattern"; then
    echo -e "  ${GREEN}PASS${RESET}  $name"
    PASS=$((PASS + 1))
  else
    echo -e "  ${RED}FAIL${RESET}  $name"
    echo "        expected output to contain: $pattern"
    echo "        actual output: $output"
    FAIL=$((FAIL + 1))
  fi
}

# ─── Test Runner ──────────────────────────────────────────────────────────────

run_test() {
  local name="$1" fn="$2"
  if [[ -n "$FILTER" ]] && [[ "$name" != *"$FILTER"* ]]; then
    SKIP=$((SKIP + 1))
    return 0
  fi
  CURRENT_TEST="$name"
  echo -e "${BOLD}$name${RESET}"
  reset_state
  "$fn"
  echo ""
}

# ═══════════════════════════════════════════════════════════════════════════════
# VALIDATION HOOK TESTS
# ═══════════════════════════════════════════════════════════════════════════════

test_validation_skip_wrong_session() {
  echo "80" > "$TEST_DIR/runtime/session-counter"
  run_hook validation-memories.sh
  assert_log_contains "SKIP: session 80 is not 75 mod 100" "skips when session is not 75 mod 100"
  assert_claude_not_invoked "claude not spawned"
}

test_validation_skip_various_sessions() {
  for s in 0 1 50 74 76 99 100 174 176 200; do
    reset_state
    echo "$s" > "$TEST_DIR/runtime/session-counter"
    echo "0" > "$TEST_DIR/runtime/last-validation-session"
    run_hook validation-memories.sh
    assert_log_contains "SKIP: session $s is not 75 mod 100" "skips session $s"
  done
}

test_validation_first_time_init() {
  echo "75" > "$TEST_DIR/runtime/session-counter"
  run_hook validation-memories.sh
  assert_log_contains "Initialized last-validation-session at session 75" "initializes lock file"
  assert_file_content "$TEST_DIR/runtime/last-validation-session" "75" "lock file contains 75"
  assert_claude_not_invoked "claude not spawned on first init"
}

test_validation_triggers() {
  echo "175" > "$TEST_DIR/runtime/session-counter"
  echo "75" > "$TEST_DIR/runtime/last-validation-session"
  run_hook validation-memories.sh
  assert_log_contains "Validation agent triggered (session 175)" "triggers at session 175"
  assert_log_contains "Spawning content validation agent" "spawns content validation agent"
  assert_log_contains "Spawning descriptor update agent" "spawns descriptor update agent"
  assert_file_content "$TEST_DIR/runtime/last-validation-session" "175" "lock updated to 175"
  assert_claude_invoked "claude was spawned"
}

test_validation_lock_prevents_duplicate() {
  echo "175" > "$TEST_DIR/runtime/session-counter"
  echo "175" > "$TEST_DIR/runtime/last-validation-session"
  run_hook validation-memories.sh
  assert_log_contains "SKIP: already ran for session 175" "lock prevents duplicate run"
  assert_claude_not_invoked "claude not spawned"
}

test_validation_toggle_off() {
  echo "175" > "$TEST_DIR/runtime/session-counter"
  echo "75" > "$TEST_DIR/runtime/last-validation-session"
  sed -i 's/MEMORY_VALIDATION=on/MEMORY_VALIDATION=off/' "$TEST_DIR/agent.conf"
  run_hook validation-memories.sh
  # Log should be empty — hook exits before logging anything
  assert_log_not_contains "Validation hook fired" "toggle off skips entirely"
  assert_claude_not_invoked "claude not spawned"
}

test_validation_recursion_guard() {
  echo "175" > "$TEST_DIR/runtime/session-counter"
  echo "75" > "$TEST_DIR/runtime/last-validation-session"
  BLOCK_HOOK_AGENTS=1 run_hook validation-memories.sh
  assert_log_not_contains "Validation hook fired" "recursion guard skips entirely"
  assert_claude_not_invoked "claude not spawned"
}

test_validation_selects_memories() {
  echo "275" > "$TEST_DIR/runtime/session-counter"
  echo "175" > "$TEST_DIR/runtime/last-validation-session"
  run_hook validation-memories.sh
  assert_log_contains "Selected" "logs selected memory count"
  # Verify the count matches actual memory files (up to 20)
  local mem_count
  mem_count=$(find "$TEST_DIR/memory" -name '*.md' | wc -l)
  local expected=$((mem_count > 20 ? 20 : mem_count))
  assert_log_contains "Selected $expected memories for validation" "selects correct number of memories"
}

test_validation_no_session_counter() {
  rm -f "$TEST_DIR/runtime/session-counter"
  run_hook validation-memories.sh
  assert_log_contains "SKIP: session counter not found" "skips without session counter"
  assert_claude_not_invoked "claude not spawned"
}

test_validation_lock_written_before_spawn() {
  # Verify the lock is written BEFORE claude is invoked (the bug prevention).
  # We do this by checking that after the run, lock=CURRENT even if claude "fails".
  # Replace mock claude with one that exits 1.
  cat > "$MOCK_BIN/claude" << FAILMOCK
#!/usr/bin/env bash
cat > /dev/null
echo "\$@" > $MOCK_BREADCRUMB
exit 1
FAILMOCK
  chmod +x "$MOCK_BIN/claude"

  echo "375" > "$TEST_DIR/runtime/session-counter"
  echo "275" > "$TEST_DIR/runtime/last-validation-session"
  run_hook validation-memories.sh
  assert_file_content "$TEST_DIR/runtime/last-validation-session" "375" "lock written before spawn (persists despite agent failure)"

  # Restore normal mock
  cat > "$MOCK_BIN/claude" << MOCK
#!/usr/bin/env bash
cat > /dev/null
echo "\$@" > $MOCK_BREADCRUMB
echo "mock-claude-response"
exit 0
MOCK
  chmod +x "$MOCK_BIN/claude"
}

# ═══════════════════════════════════════════════════════════════════════════════
# FORGETTING HOOK TESTS
# ═══════════════════════════════════════════════════════════════════════════════

test_forgetting_skip_wrong_session() {
  echo "150" > "$TEST_DIR/runtime/session-counter"
  run_hook forgetting-memories.sh
  assert_log_contains "SKIP: session 150 is not 0 mod 200" "skips when session is not 0 mod 200"
  assert_claude_not_invoked "claude not spawned"
}

test_forgetting_skip_various_sessions() {
  for s in 1 50 99 100 150 199 201 399; do
    reset_state
    echo "$s" > "$TEST_DIR/runtime/session-counter"
    echo "0" > "$TEST_DIR/runtime/last-forgetting-session"
    run_hook forgetting-memories.sh
    assert_log_contains "SKIP: session $s is not 0 mod 200" "skips session $s"
  done
}

test_forgetting_first_time_init() {
  echo "200" > "$TEST_DIR/runtime/session-counter"
  run_hook forgetting-memories.sh
  assert_log_contains "Initialized last-forgetting-session at session 200" "initializes lock file"
  assert_file_content "$TEST_DIR/runtime/last-forgetting-session" "200" "lock file contains 200"
  assert_claude_not_invoked "claude not spawned on first init"
}

test_forgetting_triggers() {
  echo "400" > "$TEST_DIR/runtime/session-counter"
  echo "200" > "$TEST_DIR/runtime/last-forgetting-session"
  run_hook forgetting-memories.sh
  assert_log_contains "Forgetting agent triggered (session 400)" "triggers at session 400"
  assert_log_contains "Spawning forgetting agent" "spawns forgetting agent"
  assert_file_content "$TEST_DIR/runtime/last-forgetting-session" "400" "lock updated to 400"
  assert_claude_invoked "claude was spawned"
}

test_forgetting_lock_prevents_duplicate() {
  echo "400" > "$TEST_DIR/runtime/session-counter"
  echo "400" > "$TEST_DIR/runtime/last-forgetting-session"
  run_hook forgetting-memories.sh
  assert_log_contains "SKIP: already ran for session 400" "lock prevents duplicate run"
  assert_claude_not_invoked "claude not spawned"
}

test_forgetting_toggle_off() {
  echo "400" > "$TEST_DIR/runtime/session-counter"
  echo "200" > "$TEST_DIR/runtime/last-forgetting-session"
  sed -i 's/MEMORY_FORGETTING=on/MEMORY_FORGETTING=off/' "$TEST_DIR/agent.conf"
  run_hook forgetting-memories.sh
  assert_log_not_contains "Forgetting hook fired" "toggle off skips entirely"
  assert_claude_not_invoked "claude not spawned"
}

test_forgetting_recursion_guard() {
  echo "400" > "$TEST_DIR/runtime/session-counter"
  echo "200" > "$TEST_DIR/runtime/last-forgetting-session"
  BLOCK_HOOK_AGENTS=1 run_hook forgetting-memories.sh
  assert_log_not_contains "Forgetting hook fired" "recursion guard skips entirely"
  assert_claude_not_invoked "claude not spawned"
}

test_forgetting_no_session_counter() {
  rm -f "$TEST_DIR/runtime/session-counter"
  run_hook forgetting-memories.sh
  assert_log_contains "SKIP: session counter not found" "skips without session counter"
  assert_claude_not_invoked "claude not spawned"
}

test_forgetting_lock_written_before_spawn() {
  cat > "$MOCK_BIN/claude" << FAILMOCK
#!/usr/bin/env bash
cat > /dev/null
echo "\$@" > $MOCK_BREADCRUMB
exit 1
FAILMOCK
  chmod +x "$MOCK_BIN/claude"

  echo "600" > "$TEST_DIR/runtime/session-counter"
  echo "400" > "$TEST_DIR/runtime/last-forgetting-session"
  run_hook forgetting-memories.sh
  assert_file_content "$TEST_DIR/runtime/last-forgetting-session" "600" "lock written before spawn (persists despite agent failure)"

  cat > "$MOCK_BIN/claude" << MOCK
#!/usr/bin/env bash
cat > /dev/null
echo "\$@" > $MOCK_BREADCRUMB
echo "mock-claude-response"
exit 0
MOCK
  chmod +x "$MOCK_BIN/claude"
}

# ═══════════════════════════════════════════════════════════════════════════════
# MEMORY TOOL TESTS (forget-memory, appreciate-memory)
# ═══════════════════════════════════════════════════════════════════════════════

run_tool() {
  local tool="$1"
  shift
  CLAUDE_PROJECT_DIR="$TEST_DIR" AGENT_TERMINAL_PID="" \
    "$TEST_DIR/src/memory/$tool" "$@" 2>&1
}

create_test_memory() {
  local name="$1"
  echo "Test memory — $name" > "$TEST_DIR/memory/${name}.md"
  cat > "$TEST_DIR/memory-metadata/${name}.json" << EOF
{
  "frequency": 3,
  "last_accessed_session": 10,
  "created_session": 1,
  "appreciation": 0,
  "pinned": false
}
EOF
}

# --- forget-memory tests ---

test_forget_memory_happy_path() {
  create_test_memory "test-forget-target"
  local out
  out=$(run_tool forget-memory "memory/test-forget-target.md")
  local rc=$?
  assert_exit_code "$rc" 0 "exits 0 on success"
  assert_output_contains "$out" "Archived memory/test-forget-target.md to memory-cold/" "prints archive message"
  assert_file_exists "$TEST_DIR/memory-cold/test-forget-target.md" "memory moved to cold storage"
  assert_file_exists "$TEST_DIR/memory-cold/test-forget-target.json" "metadata moved to cold storage"
  assert_file_not_exists "$TEST_DIR/memory/test-forget-target.md" "memory removed from memory/"
  assert_file_not_exists "$TEST_DIR/memory-metadata/test-forget-target.json" "metadata removed from memory-metadata/"
  # cleanup
  rm -f "$TEST_DIR/memory-cold/test-forget-target.md" "$TEST_DIR/memory-cold/test-forget-target.json"
}

test_forget_memory_no_args() {
  local out rc
  out=$(run_tool forget-memory) && rc=$? || rc=$?
  assert_exit_code "$rc" 1 "exits 1 with no args"
  assert_output_contains "$out" "Usage: forget-memory memory/" "shows usage"
}

test_forget_memory_wrong_format() {
  local out rc
  out=$(run_tool forget-memory "somefile.txt") && rc=$? || rc=$?
  assert_exit_code "$rc" 1 "exits 1 with wrong format"
  assert_output_contains "$out" "argument must match" "shows format error"
}

test_forget_memory_nonexistent() {
  local out rc
  out=$(run_tool forget-memory "memory/does-not-exist.md") && rc=$? || rc=$?
  assert_exit_code "$rc" 1 "exits 1 for nonexistent file"
  assert_output_contains "$out" "does not exist" "shows not-found error"
}

test_forget_memory_extra_args() {
  local out rc
  out=$(run_tool forget-memory "memory/foo.md" "extra") && rc=$? || rc=$?
  assert_exit_code "$rc" 1 "exits 1 with extra args"
  assert_output_contains "$out" "expected exactly 1 argument" "shows arg count error"
}

test_forget_memory_no_metadata() {
  # Memory exists but metadata doesn't — should still archive the .md
  echo "orphan memory" > "$TEST_DIR/memory/test-orphan.md"
  rm -f "$TEST_DIR/memory-metadata/test-orphan.json"
  local out
  out=$(run_tool forget-memory "memory/test-orphan.md")
  local rc=$?
  assert_exit_code "$rc" 0 "exits 0 even without metadata"
  assert_file_exists "$TEST_DIR/memory-cold/test-orphan.md" "memory moved to cold storage"
  assert_file_not_exists "$TEST_DIR/memory-cold/test-orphan.json" "no metadata file created in cold storage"
  # cleanup
  rm -f "$TEST_DIR/memory-cold/test-orphan.md"
}

# --- appreciate-memory tests ---

test_appreciate_memory_happy_path() {
  create_test_memory "test-appreciate-target"
  local out
  out=$(run_tool appreciate-memory "memory/test-appreciate-target.md" 2)
  local rc=$?
  assert_exit_code "$rc" 0 "exits 0 on success"
  assert_output_contains "$out" "Bumped appreciation of memory/test-appreciate-target.md by +2 (now 2)" "prints bump message"
  # Verify JSON was updated
  local appr
  appr=$(python3 -c "import json; print(json.load(open('$TEST_DIR/memory-metadata/test-appreciate-target.json'))['appreciation'])")
  if [[ "$appr" == "2" ]]; then
    echo -e "  ${GREEN}PASS${RESET}  appreciation updated in metadata JSON"
    PASS=$((PASS + 1))
  else
    echo -e "  ${RED}FAIL${RESET}  appreciation updated in metadata JSON"
    echo "        expected: 2, actual: $appr"
    FAIL=$((FAIL + 1))
  fi
  # cleanup
  rm -f "$TEST_DIR/memory/test-appreciate-target.md" "$TEST_DIR/memory-metadata/test-appreciate-target.json"
}

test_appreciate_memory_stacks() {
  create_test_memory "test-appreciate-stack"
  run_tool appreciate-memory "memory/test-appreciate-stack.md" 1 > /dev/null
  local out
  out=$(run_tool appreciate-memory "memory/test-appreciate-stack.md" 3)
  local rc=$?
  assert_exit_code "$rc" 0 "exits 0 on second bump"
  assert_output_contains "$out" "now 4" "appreciation stacks (1+3=4)"
  # cleanup
  rm -f "$TEST_DIR/memory/test-appreciate-stack.md" "$TEST_DIR/memory-metadata/test-appreciate-stack.json"
}

test_appreciate_memory_no_args() {
  local out rc
  out=$(run_tool appreciate-memory) && rc=$? || rc=$?
  assert_exit_code "$rc" 1 "exits 1 with no args"
  assert_output_contains "$out" "Usage: appreciate-memory memory/" "shows usage"
}

test_appreciate_memory_wrong_format() {
  local out rc
  out=$(run_tool appreciate-memory "somefile.txt" 1) && rc=$? || rc=$?
  assert_exit_code "$rc" 1 "exits 1 with wrong format"
  assert_output_contains "$out" "first argument must match" "shows format error"
}

test_appreciate_memory_nonexistent() {
  local out rc
  out=$(run_tool appreciate-memory "memory/does-not-exist.md" 1) && rc=$? || rc=$?
  assert_exit_code "$rc" 1 "exits 1 for nonexistent file"
  assert_output_contains "$out" "does not exist" "shows not-found error"
}

test_appreciate_memory_zero_amount() {
  create_test_memory "test-appreciate-zero"
  local out rc
  out=$(run_tool appreciate-memory "memory/test-appreciate-zero.md" 0) && rc=$? || rc=$?
  assert_exit_code "$rc" 1 "exits 1 with zero amount"
  assert_output_contains "$out" "must be a positive integer" "shows integer error"
  # cleanup
  rm -f "$TEST_DIR/memory/test-appreciate-zero.md" "$TEST_DIR/memory-metadata/test-appreciate-zero.json"
}

test_appreciate_memory_non_integer() {
  create_test_memory "test-appreciate-nan"
  local out rc
  out=$(run_tool appreciate-memory "memory/test-appreciate-nan.md" "abc") && rc=$? || rc=$?
  assert_exit_code "$rc" 1 "exits 1 with non-integer"
  assert_output_contains "$out" "must be a positive integer" "shows integer error for string"
  # cleanup
  rm -f "$TEST_DIR/memory/test-appreciate-nan.md" "$TEST_DIR/memory-metadata/test-appreciate-nan.json"
}

test_appreciate_memory_no_metadata() {
  echo "orphan memory" > "$TEST_DIR/memory/test-no-meta.md"
  rm -f "$TEST_DIR/memory-metadata/test-no-meta.json"
  local out rc
  out=$(run_tool appreciate-memory "memory/test-no-meta.md" 1) && rc=$? || rc=$?
  assert_exit_code "$rc" 1 "exits 1 without metadata"
  assert_output_contains "$out" "metadata file" "shows metadata error"
  # cleanup
  rm -f "$TEST_DIR/memory/test-no-meta.md"
}

# ═══════════════════════════════════════════════════════════════════════════════
# CUSTOM SCHEDULE TESTS
# ═══════════════════════════════════════════════════════════════════════════════

test_validation_custom_schedule() {
  # Set schedule to 75/150 → fires at session % 150 == 75
  sed -i 's/MEMORY_VALIDATION_SCHEDULE=75\/100/MEMORY_VALIDATION_SCHEDULE=75\/150/' "$TEST_DIR/agent.conf"
  echo "225" > "$TEST_DIR/runtime/session-counter"
  echo "75" > "$TEST_DIR/runtime/last-validation-session"
  run_hook validation-memories.sh
  assert_log_contains "Validation agent triggered (session 225)" "triggers with custom schedule 75/150 at session 225"
  assert_claude_invoked "claude was spawned"
}

test_validation_custom_schedule_skip() {
  sed -i 's/MEMORY_VALIDATION_SCHEDULE=75\/100/MEMORY_VALIDATION_SCHEDULE=75\/150/' "$TEST_DIR/agent.conf"
  echo "100" > "$TEST_DIR/runtime/session-counter"
  run_hook validation-memories.sh
  assert_log_contains "SKIP: session 100 is not 75 mod 150" "skips non-matching session with custom schedule"
  assert_claude_not_invoked "claude not spawned"
}

test_forgetting_custom_schedule() {
  # Set schedule to 0/50 → fires at session % 50 == 0
  sed -i 's/MEMORY_FORGETTING_SCHEDULE=0\/200/MEMORY_FORGETTING_SCHEDULE=0\/50/' "$TEST_DIR/agent.conf"
  echo "100" > "$TEST_DIR/runtime/session-counter"
  echo "50" > "$TEST_DIR/runtime/last-forgetting-session"
  run_hook forgetting-memories.sh
  assert_log_contains "Forgetting agent triggered (session 100)" "triggers with custom schedule 0/50 at session 100"
  assert_claude_invoked "claude was spawned"
}

test_forgetting_custom_schedule_skip() {
  sed -i 's/MEMORY_FORGETTING_SCHEDULE=0\/200/MEMORY_FORGETTING_SCHEDULE=0\/50/' "$TEST_DIR/agent.conf"
  echo "30" > "$TEST_DIR/runtime/session-counter"
  run_hook forgetting-memories.sh
  assert_log_contains "SKIP: session 30 is not 0 mod 50" "skips non-matching session with custom schedule"
  assert_claude_not_invoked "claude not spawned"
}

test_schedule_defaults_when_missing() {
  # Remove schedule lines from agent.conf — hooks should fall back to defaults
  sed -i '/MEMORY_FORGETTING_SCHEDULE/d' "$TEST_DIR/agent.conf"
  sed -i '/MEMORY_VALIDATION_SCHEDULE/d' "$TEST_DIR/agent.conf"
  echo "150" > "$TEST_DIR/runtime/session-counter"
  run_hook forgetting-memories.sh
  assert_log_contains "SKIP: session 150 is not 0 mod 200" "forgetting defaults to 0/200 when config missing"
  reset_state
  sed -i '/MEMORY_FORGETTING_SCHEDULE/d' "$TEST_DIR/agent.conf"
  sed -i '/MEMORY_VALIDATION_SCHEDULE/d' "$TEST_DIR/agent.conf"
  echo "80" > "$TEST_DIR/runtime/session-counter"
  run_hook validation-memories.sh
  assert_log_contains "SKIP: session 80 is not 75 mod 100" "validation defaults to 75/100 when config missing"
}

# ═══════════════════════════════════════════════════════════════════════════════
# CROSS-HOOK TESTS
# ═══════════════════════════════════════════════════════════════════════════════

test_no_schedule_collision() {
  # Verify that no session number in 0..9999 triggers both hooks
  local collisions
  collisions=$(python3 -c "
collisions = [s for s in range(10000) if s % 200 == 0 and s % 100 == 75]
print(len(collisions))
")
  if [[ "$collisions" == "0" ]]; then
    echo -e "  ${GREEN}PASS${RESET}  no session triggers both forgetting and validation (checked 0..9999)"
    PASS=$((PASS + 1))
  else
    echo -e "  ${RED}FAIL${RESET}  found $collisions sessions that trigger both hooks"
    FAIL=$((FAIL + 1))
  fi
}

test_session_0_triggers_forgetting_not_validation() {
  # Session 0: 0%200==0 (forgetting candidate), 0%100!=75 (not validation)
  echo "0" > "$TEST_DIR/runtime/session-counter"
  run_hook validation-memories.sh
  assert_log_contains "SKIP: session 0 is not 75 mod 100" "session 0 skips validation"
  reset_state
  echo "0" > "$TEST_DIR/runtime/session-counter"
  run_hook forgetting-memories.sh
  # No lock file → first-time init
  assert_log_contains "Initialized last-forgetting-session at session 0" "session 0 initializes forgetting"
}

# ═══════════════════════════════════════════════════════════════════════════════
# MAIN
# ═══════════════════════════════════════════════════════════════════════════════

trap teardown_suite EXIT

echo ""
echo -e "${BOLD}═══ Agent Hook Test Suite ═══${RESET}"
echo ""

setup_suite

# Validation tests
run_test "validation: skip wrong session"               test_validation_skip_wrong_session
run_test "validation: skip various sessions"             test_validation_skip_various_sessions
run_test "validation: first-time init"                   test_validation_first_time_init
run_test "validation: triggers correctly"                test_validation_triggers
run_test "validation: lock prevents duplicate"           test_validation_lock_prevents_duplicate
run_test "validation: toggle off"                        test_validation_toggle_off
run_test "validation: recursion guard"                   test_validation_recursion_guard
run_test "validation: selects memories"                  test_validation_selects_memories
run_test "validation: no session counter"                test_validation_no_session_counter
run_test "validation: lock written before spawn"         test_validation_lock_written_before_spawn

# Forgetting tests
run_test "forgetting: skip wrong session"                test_forgetting_skip_wrong_session
run_test "forgetting: skip various sessions"             test_forgetting_skip_various_sessions
run_test "forgetting: first-time init"                   test_forgetting_first_time_init
run_test "forgetting: triggers correctly"                test_forgetting_triggers
run_test "forgetting: lock prevents duplicate"           test_forgetting_lock_prevents_duplicate
run_test "forgetting: toggle off"                        test_forgetting_toggle_off
run_test "forgetting: recursion guard"                   test_forgetting_recursion_guard
run_test "forgetting: no session counter"                test_forgetting_no_session_counter
run_test "forgetting: lock written before spawn"         test_forgetting_lock_written_before_spawn

# Memory tool tests
run_test "forget-memory: happy path"                     test_forget_memory_happy_path
run_test "forget-memory: no args"                        test_forget_memory_no_args
run_test "forget-memory: wrong format"                   test_forget_memory_wrong_format
run_test "forget-memory: nonexistent file"               test_forget_memory_nonexistent
run_test "forget-memory: extra args"                     test_forget_memory_extra_args
run_test "forget-memory: no metadata"                    test_forget_memory_no_metadata
run_test "appreciate-memory: happy path"                 test_appreciate_memory_happy_path
run_test "appreciate-memory: stacks"                     test_appreciate_memory_stacks
run_test "appreciate-memory: no args"                    test_appreciate_memory_no_args
run_test "appreciate-memory: wrong format"               test_appreciate_memory_wrong_format
run_test "appreciate-memory: nonexistent file"           test_appreciate_memory_nonexistent
run_test "appreciate-memory: zero amount"                test_appreciate_memory_zero_amount
run_test "appreciate-memory: non-integer amount"         test_appreciate_memory_non_integer
run_test "appreciate-memory: no metadata"                test_appreciate_memory_no_metadata

# Custom schedule tests
run_test "validation: custom schedule triggers"          test_validation_custom_schedule
run_test "validation: custom schedule skips"             test_validation_custom_schedule_skip
run_test "forgetting: custom schedule triggers"          test_forgetting_custom_schedule
run_test "forgetting: custom schedule skips"             test_forgetting_custom_schedule_skip
run_test "schedules: defaults when config missing"       test_schedule_defaults_when_missing

# Cross-hook tests
run_test "cross-hook: no schedule collision"             test_no_schedule_collision
run_test "cross-hook: session 0 behavior"               test_session_0_triggers_forgetting_not_validation

# ─── Report ───────────────────────────────────────────────────────────────────

echo -e "${BOLD}═══ Results ═══${RESET}"
TOTAL=$((PASS + FAIL))
if [[ $SKIP -gt 0 ]]; then
  echo -e "  ${YELLOW}Skipped: $SKIP${RESET}"
fi
echo -e "  ${GREEN}Passed:  $PASS${RESET}"
if [[ $FAIL -gt 0 ]]; then
  echo -e "  ${RED}Failed:  $FAIL${RESET}"
  echo -e "  Total:   $TOTAL"
  echo ""
  exit 1
else
  echo -e "  Total:   $TOTAL"
  echo ""
  echo -e "  ${GREEN}All tests passed.${RESET}"
  echo ""
  exit 0
fi
