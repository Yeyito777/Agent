#!/usr/bin/env bash
# test-recall.sh — Test harness for the memory recall system
# Usage:
#   ./src/hooks/test-recall.sh                          # Run all built-in test cases
#   ./src/hooks/test-recall.sh "custom prompt here"     # Test a single custom prompt
#   ./src/hooks/test-recall.sh --system "custom system prompt" # Override system prompt for all tests
#
# Environment:
#   RECALL_SYSTEM_PROMPT — override the system prompt (alternative to --system flag)
#   RECALL_MODEL — override model (default: opus)

set -euo pipefail

AGENT_DIR="/home/yeyito/Workspace/Agent"
MODEL="${RECALL_MODEL:-opus}"

# --- Parse args ---
CUSTOM_SYSTEM_PROMPT=""
CUSTOM_PROMPT=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --system) CUSTOM_SYSTEM_PROMPT="$2"; shift 2 ;;
    *) CUSTOM_PROMPT="$1"; shift ;;
  esac
done

# --- Generate pointers ---
POINTERS=$(python3 - "$AGENT_DIR" <<'PYEOF'
import sys
from pathlib import Path
d = Path(sys.argv[1]) / "memory"
if d.exists():
    for f in sorted(d.glob("*.md")):
        desc = f.read_text().split("\n")[0].strip()
        print(f"- memory/{f.name} — {desc}")
PYEOF
)

DEFAULT_SYSTEM_PROMPT='You are a memory retrieval system. You receive a user prompt and a list of memory files with descriptions. Output ONLY the filenames (one per line, e.g. memory/foo-bar.md) of memories relevant to the user'"'"'s prompt. No explanations, no markdown, no numbering. If none are relevant, output nothing.'
SYSTEM_PROMPT="${CUSTOM_SYSTEM_PROMPT:-${RECALL_SYSTEM_PROMPT:-$DEFAULT_SYSTEM_PROMPT}}"

# --- Colors ---
GREEN='\e[38;2;46;196;182m'
RED='\e[38;2;255;100;100m'
DIM='\e[38;2;120;120;120m'
BOLD='\e[1m'
RESET='\e[0m'

# --- Test runner ---
PASS=0
FAIL=0
TOTAL=0

run_test() {
  local prompt="$1"
  shift
  local expected=("$@")  # remaining args are expected filenames

  TOTAL=$((TOTAL + 1))

  local result
  result=$(echo "User prompt:
${prompt}

Available memories:
${POINTERS}" | AGENT_HOOK_ID="" RECALL_HOOK_RUNNING=1 timeout 30 claude -p \
    --model "$MODEL" \
    --max-turns 1 \
    --no-session-persistence \
    --system-prompt "$SYSTEM_PROMPT" 2>/dev/null) || result=""

  # Normalize result to sorted lines
  local got
  got=$(echo "$result" | tr -d '[:space:]' | grep '^memory/' | sort || true)

  # Check expected
  local expected_sorted
  expected_sorted=$(printf '%s\n' "${expected[@]}" | sort)

  # Match check: every expected file should appear in result
  local all_found=true
  local found_list=""
  local missed_list=""
  for exp in "${expected[@]}"; do
    if echo "$result" | grep -qF "$exp"; then
      found_list="${found_list} ${exp}"
    else
      missed_list="${missed_list} ${exp}"
      all_found=false
    fi
  done

  # Extra results (not in expected)
  local extra_list=""
  while IFS= read -r line; do
    line=$(echo "$line" | tr -d '[:space:]')
    [[ -z "$line" ]] && continue
    [[ "$line" != memory/* ]] && continue
    local is_expected=false
    for exp in "${expected[@]}"; do
      [[ "$line" == "$exp" ]] && is_expected=true
    done
    if ! $is_expected; then
      extra_list="${extra_list} ${line}"
    fi
  done <<< "$result"

  # Print result
  printf "${BOLD}Test %d:${RESET} %s\n" "$TOTAL" "$prompt"
  printf "  ${DIM}Raw response: %s${RESET}\n" "${result:-<empty>}"

  if $all_found; then
    PASS=$((PASS + 1))
    printf "  ${GREEN}PASS${RESET} — found:${found_list}\n"
  else
    FAIL=$((FAIL + 1))
    printf "  ${RED}FAIL${RESET} — missed:${missed_list}\n"
    [[ -n "$found_list" ]] && printf "  ${DIM}found:${found_list}${RESET}\n"
  fi
  [[ -n "$extra_list" ]] && printf "  ${DIM}extras:${extra_list}${RESET}\n"
  echo ""
}

# --- Custom single prompt mode ---
if [[ -n "$CUSTOM_PROMPT" ]]; then
  printf "${BOLD}System prompt:${RESET} %s\n\n" "$SYSTEM_PROMPT"
  printf "${BOLD}Model:${RESET} %s\n\n" "$MODEL"
  run_test "$CUSTOM_PROMPT" ""
  exit 0
fi

# --- Built-in test suite ---
printf "${BOLD}System prompt:${RESET} %s\n\n" "$SYSTEM_PROMPT"
printf "${BOLD}Model:${RESET} %s\n\n" "$MODEL"
printf "${BOLD}Available memories:${RESET}\n%s\n\n" "$POINTERS"
echo "========================================="
echo ""

# Single-topic tests (should match exactly one)
run_test "my todo" \
  "memory/about-user-todo-organization.md"

run_test "How do I remap my keyboard?" \
  "memory/user-keyboard-configuration.md"

run_test "What do you think of your memory system?" \
  "memory/automatic-memory-recall-system.md"

run_test "How do I build dwm?" \
  "memory/user-suckless-build-workflow.md"

run_test "What colors does my terminal use?" \
  "memory/user-terminal-color-scheme.md"

run_test "Where is my git config?" \
  "memory/user-git-config-location.md"

run_test "How much disk space do I have?" \
  "memory/disk-audit-cleanup-guide.md"

run_test "How does dmenu work?" \
  "memory/dmenu-usage-and-scripting.md"

run_test "My swap file" \
  "memory/swap-file-configuration.md"

run_test "The watchdog shutdown message" \
  "memory/watchdog-shutdown-message.md"

# Multi-topic tests (should match multiple)
run_test "I want to change my terminal colors and also my keyboard mapping" \
  "memory/user-terminal-color-scheme.md" \
  "memory/user-keyboard-configuration.md"

run_test "Tell me about my todo and my memory system" \
  "memory/about-user-todo-organization.md" \
  "memory/automatic-memory-recall-system.md"

run_test "Memories, my todo, how you are built claude, your source, your memory system." \
  "memory/about-user-todo-organization.md" \
  "memory/automatic-memory-recall-system.md" \
  "memory/claude-code-binary-inspection.md"

# Negative test (should match nothing)
run_test "What is 2+2?"

# Summary
echo "========================================="
printf "${BOLD}Results: ${GREEN}%d passed${RESET}, ${RED}%d failed${RESET} out of %d\n" "$PASS" "$FAIL" "$TOTAL"
