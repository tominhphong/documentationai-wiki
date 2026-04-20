# Task Board — documentationai-wiki

**Protocol:** Kanban. Claim task by moving to IN-PROGRESS with `[winN]` tag. Update status after every commit.

**Legend:**
- `[ ]` = TODO (unclaimed)
- `[>]` = IN-PROGRESS (currently worked on)
- `[R]` = REVIEW (PR submitted, waiting on Win 4 QA + Win 1 merge)
- `[x]` = DONE

---

## 🔴 TODO

### Win 2 — Framework Author

_(all claimed — see IN-PROGRESS)_

### Win 3 — Workflow Writer

- [ ] **W3-02** Write `workflows/multi-agent-sprint-workflow.mdx` — new page. Scope: how to run a 4-agent sprint (claim → work → review → merge → deploy). Reference CLAUDE.md and AGENTS.md.
- [ ] **W3-03** Write `agent-instructions/lead-architect-prompt.mdx` — role prompt template for Win 1.
- [ ] **W3-04** Write `agent-instructions/worker-agent-prompt.mdx` — role prompt template for Win 2/3/4 (parameterized by scope).

### Win 4 — Reference & QA

_(claimed — see IN-PROGRESS)_

---

## 🟡 IN-PROGRESS

_(empty — all active work moved to REVIEW)_

---

## 🔵 REVIEW

### Win 2 — Framework Author (MERGED to main)

- [x] **W2-01** Expanded `agent-os-overview/introduction.mdx`
- [x] **W2-02** Created `agent-os-overview/multi-agent-collaboration.mdx`
- [x] **W2-03** Expanded `core-rules/global-operating-rules.mdx` (YAGNI/KISS/DRY)
- [x] **W2-04** Created `core-rules/file-ownership-rules.mdx`

### Win 3 — Workflow Writer

- [x] **W3-01** Expanded `workflows/content-workflow.mdx` — Steps component (MERGED)

### Win 4 — Reference & QA

- [R] **W4-01** `scripts/pre-commit-check.sh` — improved with `strip_code_content()` (merging now)
- [R] **W4-02** `help-center/troubleshooting/mdx-gotchas.mdx` — 7 gotchas (merging now)
- [R] **W4-03** `knowledge-qa/multi-agent-faq.mdx` — 12 FAQ entries (merging now)
- [R] **W4-04** Full validation pass — 31 files, 0 errors (merging now)

---

## 🟢 DONE

- [x] **W1-00** Scaffold CLAUDE.md, AGENTS.md, CODEOWNERS, plans/task-board.md, plans/progress.md, plans/findings.md — _Win 1, 2026-04-20_

---

## 📨 Cross-Scope Requests

### [2026-04-20 00:45] [win2 → win1] Add 2 new pages to documentation.json
Reason: Created `agent-os-overview/multi-agent-collaboration.mdx` and `core-rules/file-ownership-rules.mdx`
Patch:
In `documentation.json`, under `agent-os-overview` group, add after `components-and-tools`:
  `{ "path": "agent-os-overview/multi-agent-collaboration" }`
In `documentation.json`, under `core-rules` group, add after `global-operating-rules`:
  `{ "path": "core-rules/file-ownership-rules" }`
Status: pending

Format:
```
### [YYYY-MM-DD HH:MM] [winN → win1] <short title>
Reason: <why this edit is needed>
Patch:
<inline diff or clear instructions>
Status: pending | applied | rejected
```

### [2026-04-20 00:35] [win4 → win1] Add W4 pages to documentation.json nav
Reason: 2 new pages created by Win 4 need sidebar entries to be discoverable.
Patch: Add to `documentation.json` under their respective groups:
  1. Under help-center/troubleshooting group:
     `{ "title": "MDX Gotchas", "path": "help-center/troubleshooting/mdx-gotchas" }`
  2. Under knowledge-qa group:
     `{ "title": "Multi-Agent FAQ", "path": "knowledge-qa/multi-agent-faq" }`
Status: pending

---

## 📊 Sprint 1 Burn-Down

- Total tasks: 12 (4 per worker)
- Claimed: 4 (Win 4)
- In progress: 0
- Review: 4 (Win 4 — W4-01 through W4-04)
- Done: 1 (scaffold)
- Target: All TODO → DONE by end of Sprint 1

---

**Last updated:** 2026-04-20 by Win 4
