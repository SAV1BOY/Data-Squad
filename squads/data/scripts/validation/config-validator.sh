#!/usr/bin/env bash
# ============================================================
# config-validator.sh
# Validates structural integrity of the Data Squad configuration.
# Run from the squad root: squads/data/
#
# Usage:
#   cd squads/data && bash scripts/validation/config-validator.sh
#
# Exit codes:
#   0 = all checks passed
#   1 = one or more checks failed
# ============================================================

set -euo pipefail

# --- Resolve squad root (script lives in scripts/validation/) ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SQUAD_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

PASS_COUNT=0
FAIL_COUNT=0
WARN_COUNT=0

pass() {
  echo "  [PASS] $1"
  PASS_COUNT=$((PASS_COUNT + 1))
}

fail() {
  echo "  [FAIL] $1"
  FAIL_COUNT=$((FAIL_COUNT + 1))
}

warn() {
  echo "  [WARN] $1"
  WARN_COUNT=$((WARN_COUNT + 1))
}

separator() {
  echo ""
  echo "=== $1 ==="
}

# ============================================================
# CHECK 1: Validate config.yaml routing references
# For each task in config.yaml routing, check that referenced
# frameworks, checklists, and templates exist as files.
# ============================================================
separator "Check 1: config.yaml Routing References"

CONFIG_FILE="$SQUAD_ROOT/config.yaml"

if [[ ! -f "$CONFIG_FILE" ]]; then
  fail "config.yaml not found at $CONFIG_FILE"
else
  pass "config.yaml exists"

  # Extract framework references from routing section
  MISSING_FRAMEWORKS=0
  while IFS= read -r fw; do
    fw=$(echo "$fw" | xargs)  # trim whitespace
    [[ -z "$fw" ]] && continue
    if [[ ! -f "$SQUAD_ROOT/frameworks/${fw}.md" ]]; then
      fail "Framework not found: frameworks/${fw}.md"
      MISSING_FRAMEWORKS=$((MISSING_FRAMEWORKS + 1))
    fi
  done < <(sed -n '/^routing:/,/^cross_squad:/p' "$CONFIG_FILE" | grep 'frameworks:' | sed 's/.*frameworks: \[//; s/\].*//; s/,/\n/g' | tr -d ' ' | sort -u)

  if [[ "$MISSING_FRAMEWORKS" -eq 0 ]]; then
    pass "All referenced frameworks exist"
  fi

  # Extract checklist references from routing section
  MISSING_CHECKLISTS=0
  while IFS= read -r cl; do
    cl=$(echo "$cl" | xargs)
    [[ -z "$cl" ]] && continue
    if [[ ! -f "$SQUAD_ROOT/checklists/${cl}.md" ]]; then
      fail "Checklist not found: checklists/${cl}.md"
      MISSING_CHECKLISTS=$((MISSING_CHECKLISTS + 1))
    fi
  done < <(sed -n '/^routing:/,/^cross_squad:/p' "$CONFIG_FILE" | grep 'checklists:' | sed 's/.*checklists: \[//; s/\].*//; s/,/\n/g' | tr -d ' ' | sort -u)

  if [[ "$MISSING_CHECKLISTS" -eq 0 ]]; then
    pass "All referenced checklists exist"
  fi

  # Extract template references from routing section
  MISSING_TEMPLATES=0
  while IFS= read -r tpl; do
    tpl=$(echo "$tpl" | xargs)
    [[ -z "$tpl" ]] && continue
    if [[ ! -f "$SQUAD_ROOT/templates/${tpl}.md" ]]; then
      fail "Template not found: templates/${tpl}.md"
      MISSING_TEMPLATES=$((MISSING_TEMPLATES + 1))
    fi
  done < <(sed -n '/^routing:/,/^cross_squad:/p' "$CONFIG_FILE" | grep 'templates:' | sed 's/.*templates: \[//; s/\].*//; s/,/\n/g' | tr -d ' ' | sort -u)

  if [[ "$MISSING_TEMPLATES" -eq 0 ]]; then
    pass "All referenced templates exist"
  fi
fi

# ============================================================
# CHECK 2: Task files contain "## Operational Details" section
# ============================================================
separator "Check 2: Task Operational Details Sections"

TASKS_DIR="$SQUAD_ROOT/tasks"
MISSING_OPS=0
TASK_COUNT=0

if [[ ! -d "$TASKS_DIR" ]]; then
  fail "Tasks directory not found: $TASKS_DIR"
else
  while IFS= read -r task_file; do
    ((TASK_COUNT++))
    if ! grep -q "## Operational Details" "$task_file" 2>/dev/null; then
      fail "Missing '## Operational Details' in $(echo "$task_file" | sed "s|$SQUAD_ROOT/||")"
      ((MISSING_OPS++))
    fi
  done < <(find "$TASKS_DIR" -name "*.md" -type f | sort)

  if [[ "$MISSING_OPS" -eq 0 ]]; then
    pass "All $TASK_COUNT task files contain '## Operational Details'"
  else
    fail "$MISSING_OPS of $TASK_COUNT task files are missing '## Operational Details'"
  fi
fi

# ============================================================
# CHECK 3: Agent name consistency
# Generic agent names that should NOT appear in squad files.
# ============================================================
separator "Check 3: Agent Name Consistency"

GENERIC_NAMES=(
  "Data Strategist"
  "Experiment Strategist"
  "Analytics Architect"
  "Insight Narrator"
  "Growth Analyst"
)

GENERIC_FOUND=0
for name in "${GENERIC_NAMES[@]}"; do
  matches=$(grep -rl "$name" "$SQUAD_ROOT" --include="*.md" --include="*.yaml" 2>/dev/null || true)
  if [[ -n "$matches" ]]; then
    fail "Generic agent name '$name' found in:"
    while IFS= read -r match_file; do
      echo "         $(echo "$match_file" | sed "s|$SQUAD_ROOT/||")"
    done <<< "$matches"
    ((GENERIC_FOUND++))
  fi
done

if [[ "$GENERIC_FOUND" -eq 0 ]]; then
  pass "No generic agent names found"
fi

# ============================================================
# CHECK 4: Squad name consistency
# Wrong squad names that should NOT appear in Data Squad files.
# ============================================================
separator "Check 4: Squad Name Consistency"

WRONG_SQUADS=(
  "Product Squad"
  "Engineering Squad"
  "Marketing Squad"
  "Customer Success Squad"
)

WRONG_FOUND=0
for sq in "${WRONG_SQUADS[@]}"; do
  matches=$(grep -rl "$sq" "$SQUAD_ROOT" --include="*.md" --include="*.yaml" 2>/dev/null || true)
  if [[ -n "$matches" ]]; then
    fail "Wrong squad name '$sq' found in:"
    while IFS= read -r match_file; do
      echo "         $(echo "$match_file" | sed "s|$SQUAD_ROOT/||")"
    done <<< "$matches"
    ((WRONG_FOUND++))
  fi
done

if [[ "$WRONG_FOUND" -eq 0 ]]; then
  pass "No incorrect squad names found"
fi

# ============================================================
# CHECK 5: File count validation
# Report counts for key directories.
# ============================================================
separator "Check 5: File Count Report"

count_files() {
  local dir="$1"
  local label="$2"
  if [[ -d "$SQUAD_ROOT/$dir" ]]; then
    local count
    count=$(find "$SQUAD_ROOT/$dir" -name "*.md" -type f | wc -l)
    echo "  $label: $count files"
  else
    warn "$label directory not found: $dir"
  fi
}

count_files "agents"     "Agents"
count_files "tasks"      "Tasks"
count_files "templates"  "Templates"
count_files "reference"  "Reference"
count_files "frameworks" "Frameworks"
count_files "checklists" "Checklists"
count_files "workflows"  "Workflows"
count_files "docs"       "Docs"

# ============================================================
# SUMMARY
# ============================================================
echo ""
echo "============================================"
echo "  VALIDATION SUMMARY"
echo "============================================"
echo "  Passed:   $PASS_COUNT"
echo "  Failed:   $FAIL_COUNT"
echo "  Warnings: $WARN_COUNT"
echo "============================================"

if [[ "$FAIL_COUNT" -gt 0 ]]; then
  echo "  RESULT: FAIL ($FAIL_COUNT issues found)"
  exit 1
else
  echo "  RESULT: PASS (all checks passed)"
  exit 0
fi
