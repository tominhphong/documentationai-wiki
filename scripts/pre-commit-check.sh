#!/usr/bin/env bash
# pre-commit-check.sh — validate MDX content before push
# Owner: Win 4 (Reference & QA)
# Usage: bash scripts/pre-commit-check.sh [path]  (default: repo root)

set -u

TARGET="${1:-.}"
ERRORS=0

echo "=== Pre-commit check for: $TARGET ==="

# Gotcha 1 — Unicode checkbox characters
echo ""
echo "[1/4] Checking for Unicode checkboxes (☐, □)..."
HITS=$(grep -rn --include='*.mdx' -E "☐|□" "$TARGET" 2>/dev/null || true)
if [ -n "$HITS" ]; then
  echo "❌ Found Unicode checkbox characters — replace with '- [ ]':"
  echo "$HITS"
  ERRORS=$((ERRORS + 1))
else
  echo "✅ No Unicode checkboxes."
fi

# Gotcha 2 — <NUMBER% parsed as JSX
echo ""
echo "[2/4] Checking for <NUMBER% patterns..."
HITS=$(grep -rn --include='*.mdx' -E "<[0-9]" "$TARGET" 2>/dev/null || true)
if [ -n "$HITS" ]; then
  echo "❌ Found <NUMBER patterns — rephrase 'under N' or 'dưới N':"
  echo "$HITS"
  ERRORS=$((ERRORS + 1))
else
  echo "✅ No <NUMBER patterns."
fi

# Gotcha 3 — Missing frontmatter (title or description)
echo ""
echo "[3/4] Checking frontmatter (title + description required)..."
MISSING=()
while IFS= read -r -d '' f; do
  HEAD=$(head -10 "$f")
  if ! echo "$HEAD" | grep -q "^title:"; then
    MISSING+=("$f: missing 'title:'")
  fi
  if ! echo "$HEAD" | grep -q "^description:"; then
    MISSING+=("$f: missing 'description:'")
  fi
done < <(find "$TARGET" -name "*.mdx" -print0 2>/dev/null)

if [ ${#MISSING[@]} -gt 0 ]; then
  echo "❌ Missing frontmatter fields:"
  printf '  %s\n' "${MISSING[@]}"
  ERRORS=$((ERRORS + 1))
else
  echo "✅ All MDX files have title + description."
fi

# Gotcha 4 — Vietnamese ASCII (heuristic: Vietnamese-pattern words without diacritics)
echo ""
echo "[4/4] Quick heuristic for ASCII-only Vietnamese (low-confidence)..."
# Look for suspicious "phong ngu", "Ho tro", "Gia", etc. — warning only, does not fail
WARN=$(grep -rn --include='*.mdx' -E "phong ngu|Ho tro|Tu [A-Z]|Gia [0-9]" "$TARGET" 2>/dev/null || true)
if [ -n "$WARN" ]; then
  echo "⚠️  Possible ASCII-only Vietnamese (verify manually):"
  echo "$WARN"
else
  echo "✅ No obvious ASCII Vietnamese patterns."
fi

echo ""
echo "=== Summary ==="
if [ $ERRORS -eq 0 ]; then
  echo "✅ ALL CHECKS PASSED — safe to commit/push."
  exit 0
else
  echo "❌ $ERRORS check(s) failed — fix before commit/push."
  exit 1
fi
