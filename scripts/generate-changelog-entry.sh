#!/usr/bin/env bash
set -euo pipefail

# generate-changelog-entry.sh — auto-parse git log with S<N>-W pattern → Mintlify Update block
# Usage: bash scripts/generate-changelog-entry.sh <sprint-number> [since-commit]
# Example: bash scripts/generate-changelog-entry.sh 4 b9249d6
# Output: Mintlify <Update> block ready to paste into changelog.mdx

SPRINT="${1:?Sprint number required (e.g. 4)}"
SINCE="${2:-HEAD~50}"

today=$(date +%Y-%m-%d)

echo "<Update label=\"$today\" description=\"Sprint $SPRINT summary\" tags={[\"sprint-$SPRINT\", \"auto-generated\"]}>"
echo "## Sprint $SPRINT commits"
echo ""
echo "Parsed from \`git log --grep=\"S$SPRINT-W\" $SINCE..HEAD\`:"
echo ""

# Group commits by worker window (W1 W2 W3 W4)
for worker in W1 W2 W3 W4; do
  count=$(git log --grep="S$SPRINT-$worker-" "$SINCE..HEAD" --oneline 2>/dev/null | wc -l | tr -d ' ')
  if [[ "$count" -gt 0 ]]; then
    echo "### $worker ($count commits)"
    git log --grep="S$SPRINT-$worker-" "$SINCE..HEAD" --pretty=format:"- \`%h\` %s" 2>/dev/null || true
    echo ""
    echo ""
  fi
done

echo "</Update>"
