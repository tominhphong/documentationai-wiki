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

- [ ] **W2-01** Audit `agent-os-overview/introduction.mdx` — verify it covers: (a) what Agent OS is, (b) why it exists, (c) who benefits. Expand if gap.
- [ ] **W2-02** Write `agent-os-overview/multi-agent-collaboration.mdx` — new page explaining 4-agent model (Lead + 3 Workers), file ownership, cross-scope protocol. Reference this task-board as living example.
- [ ] **W2-03** Expand `core-rules/global-operating-rules.mdx` — add section on YAGNI/KISS/DRY with concrete examples from Phong's workflow.
- [ ] **W2-04** Write `core-rules/file-ownership-rules.mdx` — new page. Scope: why strict ownership, how to handle cross-scope, conflict resolution.

### Win 3 — Workflow Writer

- [ ] **W3-01** Audit `workflows/content-workflow.mdx` — add Steps component, verify ties to Core Rules (cross-link).
- [ ] **W3-02** Write `workflows/multi-agent-sprint-workflow.mdx` — new page. Scope: how to run a 4-agent sprint (claim → work → review → merge → deploy). Reference CLAUDE.md and AGENTS.md.
- [ ] **W3-03** Write `agent-instructions/lead-architect-prompt.mdx` — role prompt template for Win 1.
- [ ] **W3-04** Write `agent-instructions/worker-agent-prompt.mdx` — role prompt template for Win 2/3/4 (parameterized by scope).

### Win 4 — Reference & QA

_(claimed — see IN-PROGRESS)_

---

## 🟡 IN-PROGRESS

_(empty)_

---

## 🔵 REVIEW

### Win 4 — Reference & QA

- [R] **W4-01** [win4] `scripts/pre-commit-check.sh` — improved with `strip_code_content()` to skip code fences + inline spans; all 4 checks verified working. Awaiting Win 1 merge.
- [R] **W4-02** [win4] `help-center/troubleshooting/mdx-gotchas.mdx` — 7 gotchas documented with cause/bad/fix pattern + quick-reference table. Pre-commit PASS. Awaiting Win 1 merge.
- [R] **W4-03** [win4] `knowledge-qa/multi-agent-faq.mdx` — 12 FAQ entries covering task ownership, documentation.json, pre-commit, deploy, coordination. Pre-commit PASS. Awaiting Win 1 merge.
- [R] **W4-04** [win4] Full validation pass complete — 31 files, 0 errors. Findings logged in `plans/findings.md`. Awaiting Win 1 merge.

---

## 🟢 DONE

- [x] **W1-00** Scaffold CLAUDE.md, AGENTS.md, CODEOWNERS, plans/task-board.md, plans/progress.md, plans/findings.md — _Win 1, 2026-04-20_

---

## 📨 Cross-Scope Requests

_(Win 2/3/4: if you need to edit a file outside your scope, add an entry here — Win 1 will apply.)_

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
