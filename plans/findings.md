# Findings — documentationai-wiki

**Purpose:** Technical gotchas, decisions, blockers, insights. Append-only; consolidate periodically.

---

## MDX / Documentation.AI Gotchas (known)

- Unicode checkbox (`☐`, `□`) renders as empty square → use `- [ ]`
- `<NUMBER%>` parsed as JSX → rephrase "under 20%"
- Frontmatter `title` + `description` mandatory; missing → build fail
- Component whitelist: `Callout`, `Steps`, `Tabs`, `Columns`, `Card`, code blocks, tables. NO: `CardGroup`, `Accordion`, Mermaid, custom JSX
- Build is all-or-nothing: 1 file broken → whole site fails
- Vietnamese must have full diacritics in source (MDX does not normalize)

---

## Architecture Decisions

- **2026-04-20 Win 1:** Use filesystem (`plans/task-board.md` + `plans/progress.md`) as shared state for multi-agent coordination. Rationale: no runtime IPC between independent Claude Code CLI instances; git + markdown is lingua franca.
- **2026-04-20 Win 1:** Git worktree per worker (Win 2/3/4) to avoid branch-switch conflicts. Main branch owned by Win 1.
- **2026-04-20 Win 1:** File ownership enforced by agent self-discipline (reading CODEOWNERS), not GitHub branch protection — this repo is single-contributor at the moment.

---

## Blockers

_(empty — report here if stuck >30 min)_

Format:
```
### [YYYY-MM-DD HH:MM] [winN] <short title>
Task: WN-NN
Problem: <what's blocking>
Tried: <what you attempted>
Needs: <what resolution requires — info, decision, cross-scope edit>
```

---

## Insights

- **2026-04-20 Win 4 (W4-04):** Ran full validation pass (`bash scripts/pre-commit-check.sh .`) on all 31 `.mdx` files — ALL CHECKS PASSED. Zero Unicode checkbox issues, zero `<NUMBER` patterns, zero missing frontmatter. Vietnamese ASCII heuristic also clean.
- **2026-04-20 Win 4:** Pre-commit script initially used simple `grep -rn` which flagged documentation pages that intentionally show "bad" examples inside code blocks/spans. Fixed by adding `strip_code_content()` awk function that strips both fenced code blocks and inline code spans before grep. This prevents false positives in QA-documentation files.
- **2026-04-20 Win 4:** Avoided `sed -i ''` for in-place script editing — it silently wiped the file (0-byte result). Use `Write` tool directly for all file modifications in this repo.
