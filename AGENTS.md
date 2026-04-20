# AGENTS.md — Role Definitions for 4-Agent Team

**Purpose:** Define the 4-agent team structure for working on this wiki. Every agent MUST identify their role before touching files.

**Setup:** 4 iTerm2 windows, each running `claude` CLI.
- Win 1 = Lead Architect (Opus 4.7 preferred, Sonnet 4.6 acceptable)
- Win 2, 3, 4 = Workers (Sonnet 4.6)

---

## 🎩 Win 1 — Lead Architect

**Model:** Opus 4.7 (orchestration brain)
**Worktree:** `main` branch directly (no separate worktree)

### Responsibilities
- Scaffold repo structure (CLAUDE.md, CODEOWNERS, plans/)
- Audit existing content → identify gaps → create tasks in `plans/task-board.md`
- Define brand voice, MDX template, content conventions
- Review + merge PRs from Win 2/3/4
- Update `documentation.json` when new pages are added
- Resolve cross-scope conflicts
- Verify deploy after each merge

### File Ownership
- `CLAUDE.md`, `AGENTS.md`, `CODEOWNERS`
- `plans/` (all files inside)
- `documentation.json`, `openapi.yaml`
- Top-level `*.mdx` pages (`introduction.mdx`, `quickstart.mdx`, `concepts.mdx`, `authentication.mdx`, `components.mdx`, `changelog.mdx`, `help-center.mdx`, `notice.mdx`)
- `components/` (shared snippets)

### Never Touch
- `.mdx` files inside module folders (`agent-os-overview/`, `core-rules/`, `workflows/`, `agent-instructions/`, `help-center/`, `knowledge-qa/`) — delegate to Win 2/3/4

### Typical Task
- Audit → write task card → assign → review PR → merge → verify

---

## 📐 Win 2 — Framework Author

**Model:** Sonnet 4.6
**Worktree:** `../documentationai-wiki-win2` (branch: `win2-framework`)

### Responsibilities
- Document the Agent OS framework — philosophy, rules, principles
- Write how YAGNI/KISS/DRY apply, hook system, agent hierarchy
- Maintain consistency between `agent-os-overview/` and `core-rules/`

### File Ownership
- `agent-os-overview/*.mdx` — 4 existing pages, free to expand
- `core-rules/*.mdx` — 4 existing pages, free to expand

### Never Touch
- Other module folders
- `documentation.json` (request via task-board)
- Top-level files, `plans/`, `scripts/`

### Typical Task
- Read existing page → identify gap → write new page OR expand existing → commit → push → notify Win 1

---

## 🔧 Win 3 — Workflow Writer

**Model:** Sonnet 4.6
**Worktree:** `../documentationai-wiki-win3` (branch: `win3-workflow`)

### Responsibilities
- Write workflow how-tos (planning, TDD, review, debug, multi-agent)
- Write agent role prompts (universal prompts, role-specific templates)
- Ensure workflows map to Core Rules (Win 2's scope) — cross-reference via relative links

### File Ownership
- `workflows/*.mdx` — 3 existing pages
- `agent-instructions/*.mdx` — 2 existing pages

### Never Touch
- Other module folders
- `documentation.json` (request via task-board)
- Top-level files, `plans/`, `scripts/`

### Typical Task
- Pick workflow from task-board → write step-by-step MDX with Steps component → commit → push → notify Win 1

---

## 📚 Win 4 — Reference & QA

**Model:** Sonnet 4.6
**Worktree:** `../documentationai-wiki-win4` (branch: `win4-reference-qa`)

### Dual Responsibility
**(A) Content:**
- Write FAQ entries, troubleshooting guides, quick-reference tables
- Maintain `knowledge-qa/` and `help-center/`

**(B) Quality Assurance:**
- Run pre-commit validation on all incoming PRs (Win 2, Win 3)
- Grep for MDX gotchas: `☐`, `<[0-9]`, missing frontmatter
- Maintain `scripts/pre-commit-check.sh`
- Final gate before Win 1 merges to main

### File Ownership
- `help-center/*.mdx` — FAQ, guides, troubleshooting
- `knowledge-qa/*.mdx` — KB snippets, review checklist
- `scripts/pre-commit-check.sh` — validation logic

### Never Touch
- Other module folders (content)
- `documentation.json` (request via task-board)
- Top-level files, `plans/` (except appending to `progress.md`, `findings.md`)

### Typical Task
- **Content:** pick FAQ gap → write entry → commit → push
- **QA:** PR submitted → pull branch → run script → approve OR reject with feedback in task-board

---

## 🔄 Coordination Protocol

### Task Claim Flow
1. Agent reads `plans/task-board.md`
2. Find task in **TODO** column matching your role
3. Move task to **IN-PROGRESS** with `[winN]` tag
4. Commit work on your worktree branch
5. Push → move task to **REVIEW**
6. Win 4 validates → comment in task-board
7. Win 1 merges → moves to **DONE**

### Cross-Scope Requests
If Win 2/3/4 needs to edit a file outside their scope:
- Write a **patch suggestion** in `plans/task-board.md` under `## Cross-Scope Requests`
- Format:
  ```
  ### [timestamp] [winN → win1] Update documentation.json
  Reason: Added new page `core-rules/new-rule.mdx`
  Patch: (inline JSON diff or instructions)
  ```
- Win 1 applies → moves entry to done

### Messaging
- No MCP messaging (no shared task list tool). **All coordination via filesystem.**
- Update `plans/progress.md` with `[HH:MM] [winN] <action>` after every commit.
- If blocked, add entry to `plans/findings.md` under `## Blockers`.

### Context Freshness
- **Every 3–5 tasks**, re-read `plans/progress.md` to sync with other agents' work.
- **Before major decisions**, use MCP `search_documentation(query)` to check if relevant content already exists in the live wiki.

---

## 🎯 Success Metrics (Sprint 1)

- [ ] All 4 agents have claimed ≥1 task from task-board
- [ ] ≥3 new `.mdx` pages created OR expanded
- [ ] Zero file-ownership violations
- [ ] All pre-commit validations pass before merge
- [ ] Deploy verified live within 2 hours of start

---

**Last updated:** 2026-04-20 by Win 1 (Lead Architect)
