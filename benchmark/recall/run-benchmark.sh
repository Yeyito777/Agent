#!/usr/bin/env bash
# run-benchmark.sh — Run recall benchmark against all .bench files
# Pipes each test prompt into src/recall.sh, compares against expected,
# writes aggregate + per-test results to results/<date>.result

set -euo pipefail

AGENT_DIR="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "$0")/../.." && pwd)}"
BENCH_DIR="$(cd "$(dirname "$0")" && pwd)"
TESTS_DIR="${BENCH_DIR}/tests"
RESULTS_DIR="${BENCH_DIR}/results"
RECALL_SCRIPT="${AGENT_DIR}/src/recall.sh"

if [[ ! -x "$RECALL_SCRIPT" ]]; then
  echo "Error: src/recall.sh not found or not executable" >&2
  exit 1
fi

BENCH_FILES=( "$TESTS_DIR"/*.bench )
if [[ ! -f "${BENCH_FILES[0]}" ]]; then
  echo "Error: no .bench files found in $TESTS_DIR" >&2
  exit 1
fi

mkdir -p "$RESULTS_DIR"

TOTAL=${#BENCH_FILES[@]}
PERFECT=0
OVERRECALL=0
UNDERRECALL=0
TOTAL_OVER_MEMS=0
TOTAL_UNDER_MEMS=0

# Per-test results accumulator
declare -a TEST_LINES=()

echo "Running recall benchmark: ${TOTAL} test(s)"
echo ""

for (( idx=0; idx<TOTAL; idx++ )); do
  BENCH="${BENCH_FILES[$idx]}"
  BENCH_NAME=$(basename "$BENCH")
  echo "[$(( idx + 1 ))/${TOTAL}] ${BENCH_NAME}"

  # --- Parse .bench file ---
  SECTION=""
  EXPECTED=()
  PROMPT_TEXT=""

  while IFS= read -r line; do
    # Skip comments
    [[ "$line" =~ ^#.* ]] && continue

    # Detect section headers
    if [[ "$line" == "[expected]" ]]; then
      SECTION="expected"
      continue
    elif [[ "$line" == "[prompt]" ]]; then
      SECTION="prompt"
      continue
    fi

    case "$SECTION" in
      expected)
        [[ -n "$line" ]] && EXPECTED+=("$line")
        ;;
      prompt)
        if [[ -n "$PROMPT_TEXT" ]]; then
          PROMPT_TEXT="${PROMPT_TEXT}
${line}"
        else
          PROMPT_TEXT="$line"
        fi
        ;;
    esac
  done < "$BENCH"

  if [[ -z "$PROMPT_TEXT" ]]; then
    echo "  SKIP: no prompt found"
    continue
  fi

  # --- Run recall ---
  RECALLED=()
  RECALL_OUTPUT=$(echo "$PROMPT_TEXT" | "$RECALL_SCRIPT" 2>/dev/null) || {
    echo "  ERROR: recall.sh failed"
    TEST_LINES+=("$(printf '\n--- %s ---\nExpected: %s\nRecalled: ERROR\nResult: ERROR\n' \
      "$BENCH_NAME" "${EXPECTED[*]}")")
    continue
  }

  while IFS= read -r line; do
    [[ -n "$line" ]] && RECALLED+=("$line")
  done <<< "$RECALL_OUTPUT"

  # --- Compare: find missing and extra memories ---
  MISSING=()
  EXTRA=()

  # Check which expected memories are missing from recalled
  for exp in "${EXPECTED[@]}"; do
    FOUND=0
    for rec in "${RECALLED[@]+"${RECALLED[@]}"}"; do
      if [[ "$exp" == "$rec" ]]; then
        FOUND=1
        break
      fi
    done
    if (( FOUND == 0 )); then
      MISSING+=("$exp")
    fi
  done

  # Check which recalled memories are extra (not in expected)
  for rec in "${RECALLED[@]+"${RECALLED[@]}"}"; do
    FOUND=0
    for exp in "${EXPECTED[@]}"; do
      if [[ "$rec" == "$exp" ]]; then
        FOUND=1
        break
      fi
    done
    if (( FOUND == 0 )); then
      EXTRA+=("$rec")
    fi
  done

  # --- Classify ---
  MISSING_COUNT=${#MISSING[@]}
  EXTRA_COUNT=${#EXTRA[@]}

  if (( MISSING_COUNT == 0 && EXTRA_COUNT == 0 )); then
    CATEGORY="PERFECT"
    PERFECT=$(( PERFECT + 1 ))
  elif (( MISSING_COUNT == 0 && EXTRA_COUNT > 0 )); then
    CATEGORY="OVERRECALL"
    OVERRECALL=$(( OVERRECALL + 1 ))
    TOTAL_OVER_MEMS=$(( TOTAL_OVER_MEMS + EXTRA_COUNT ))
  else
    CATEGORY="UNDERRECALL"
    UNDERRECALL=$(( UNDERRECALL + 1 ))
    TOTAL_UNDER_MEMS=$(( TOTAL_UNDER_MEMS + MISSING_COUNT ))
    TOTAL_OVER_MEMS=$(( TOTAL_OVER_MEMS + EXTRA_COUNT ))
  fi

  echo "  ${CATEGORY} (expected=${#EXPECTED[@]} recalled=${#RECALLED[@]} missing=${MISSING_COUNT} extra=${EXTRA_COUNT})"

  # --- Build per-test detail ---
  DETAIL="
--- ${BENCH_NAME} ---
Expected (${#EXPECTED[@]}):"
  for exp in "${EXPECTED[@]}"; do
    DETAIL="${DETAIL}
  ${exp}"
  done
  DETAIL="${DETAIL}
Recalled (${#RECALLED[@]}):"
  for rec in "${RECALLED[@]+"${RECALLED[@]}"}"; do
    DETAIL="${DETAIL}
  ${rec}"
  done
  DETAIL="${DETAIL}
Result: ${CATEGORY}"
  if (( MISSING_COUNT > 0 )); then
    DETAIL="${DETAIL}
Missing (${MISSING_COUNT}):"
    for m in "${MISSING[@]}"; do
      DETAIL="${DETAIL}
  ${m}"
    done
  fi
  if (( EXTRA_COUNT > 0 )); then
    DETAIL="${DETAIL}
Extra (${EXTRA_COUNT}):"
    for e in "${EXTRA[@]}"; do
      DETAIL="${DETAIL}
  ${e}"
    done
  fi

  TEST_LINES+=("$DETAIL")
done

# --- Compute percentages ---
if (( TOTAL > 0 )); then
  PCT_PERFECT=$(( PERFECT * 100 / TOTAL ))
  PCT_OVER=$(( OVERRECALL * 100 / TOTAL ))
  PCT_UNDER=$(( UNDERRECALL * 100 / TOTAL ))
else
  PCT_PERFECT=0
  PCT_OVER=0
  PCT_UNDER=0
fi

TOTAL_MISRECALLED=$(( TOTAL_OVER_MEMS + TOTAL_UNDER_MEMS ))

# --- Write result file ---
RESULT_FILE="${RESULTS_DIR}/$(date +%Y-%m-%d_%H-%M-%S).result"

{
  echo "# Recall Benchmark Results"
  echo "# Date: $(date -Iseconds)"
  echo "# Tests: ${TOTAL}"
  echo ""
  echo "[summary]"
  echo "total_tests=${TOTAL}"
  echo "perfect=${PERFECT} (${PCT_PERFECT}%)"
  echo "overrecall=${OVERRECALL} (${PCT_OVER}%)"
  echo "underrecall=${UNDERRECALL} (${PCT_UNDER}%)"
  echo "total_memories_overrecalled=${TOTAL_OVER_MEMS}"
  echo "total_memories_underrecalled=${TOTAL_UNDER_MEMS}"
  echo "total_misrecalled=${TOTAL_MISRECALLED}"
  echo ""
  echo "[tests]"
  for entry in "${TEST_LINES[@]}"; do
    echo "$entry"
  done
} > "$RESULT_FILE"

echo ""
echo "========================================="
echo " Results: ${PERFECT}/${TOTAL} perfect (${PCT_PERFECT}%)"
echo " Overrecall: ${OVERRECALL} (${PCT_OVER}%) — ${TOTAL_OVER_MEMS} extra memories"
echo " Underrecall: ${UNDERRECALL} (${PCT_UNDER}%) — ${TOTAL_UNDER_MEMS} missing memories"
echo " Total misrecalled memories: ${TOTAL_MISRECALLED}"
echo "========================================="
echo ""
echo "Full results: ${RESULT_FILE}"
