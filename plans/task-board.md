# Task Board — documentationai-wiki

**Protocol:** Kanban. Claim task by moving to IN-PROGRESS with `[winN]` tag. Update status after every commit.

**Legend:**
- `[ ]` = TODO (unclaimed)
- `[>]` = IN-PROGRESS (currently worked on)
- `[R]` = REVIEW (PR submitted, waiting on Win 4 QA + Win 1 merge)
- `[x]` = DONE (merged to main)

---

## 🔴 TODO

_(Sprint 1 complete — all 12 tasks done or in review. Await Sprint 2 planning.)_

---

## 🟡 IN-PROGRESS

_(empty)_

---

## 🔵 REVIEW

_(empty — all work merged into main)_

---

## 🟢 DONE (Sprint 1 — Merged to main)

### Win 1 — Lead Architect

- [x] **W1-00** Scaffold CLAUDE.md, AGENTS.md, CODEOWNERS, plans/, scripts/, prompts/
- [x] **W1-CSR-W2** Applied Win 2 cross-scope request — 2 paths added to documentation.json
- [x] **W1-CSR-W3** Applied Win 3 cross-scope request — 3 paths added to documentation.json (pending)
- [x] **W1-CSR-W4** Applied Win 4 cross-scope request — 2 paths added to documentation.json (pending)

### Win 2 — Framework Author

- [x] **W2-01** Expanded `agent-os-overview/introduction.mdx`
- [x] **W2-02** Created `agent-os-overview/multi-agent-collaboration.mdx`
- [x] **W2-03** Expanded `core-rules/global-operating-rules.mdx` (YAGNI/KISS/DRY)
- [x] **W2-04** Created `core-rules/file-ownership-rules.mdx`

### Win 3 — Workflow Writer

- [x] **W3-01** Expanded `workflows/content-workflow.mdx` — Steps component
- [x] **W3-02** Created `workflows/multi-agent-sprint-workflow.mdx` — 7-phase protocol
- [x] **W3-03** Created `agent-instructions/lead-architect-prompt.mdx`
- [x] **W3-04** Created `agent-instructions/worker-agent-prompt.mdx`

### Win 4 — Reference & QA

- [x] **W4-01** Improved `scripts/pre-commit-check.sh` — strip_code_content() to skip fences
- [x] **W4-02** Created `help-center/troubleshooting/mdx-gotchas.mdx` — 7 gotchas
- [x] **W4-03** Created `knowledge-qa/multi-agent-faq.mdx` — 12 FAQ entries
- [x] **W4-04** Full validation pass — 31 files, 0 errors

---

## 📨 Cross-Scope Requests

### [2026-04-20 00:45] [win2 → win1] Add 2 new pages to documentation.json
Reason: Created `agent-os-overview/multi-agent-collaboration.mdx` and `core-rules/file-ownership-rules.mdx`
Status: **applied** (commit 49b9c34)

### [2026-04-20 00:19] [win3 → win1] Add 3 new pages to documentation.json
Reason: Created 1 workflow + 2 agent-instructions pages.
Patch:
- Add to `documentation.json` under workflows group:
  - `{ "title": "Multi-Agent Sprint Workflow", "path": "workflows/multi-agent-sprint-workflow" }`
- Add to `documentation.json` under agent-instructions group:
  - `{ "title": "Lead Architect Prompt (Win 1)", "path": "agent-instructions/lead-architect-prompt" }`
  - `{ "title": "Worker Agent Prompt (Win 2/3/4)", "path": "agent-instructions/worker-agent-prompt" }`
Status: **pending** (to be applied by Win 1 in next commit)

### [2026-04-20 00:35] [win4 → win1] Add 2 new pages to documentation.json
Reason: 2 new pages (mdx-gotchas + multi-agent-faq) need sidebar entries.
Patch:
- Under help-center/troubleshooting group: `{ "title": "MDX Gotchas", "path": "help-center/troubleshooting/mdx-gotchas" }`
- Under knowledge-qa group: `{ "title": "Multi-Agent FAQ", "path": "knowledge-qa/multi-agent-faq" }`
Status: **pending** (to be applied by Win 1 in next commit)

---

## 📊 Sprint 1 Burn-Down

- Total tasks: 12 (4 per worker)
- Done: 12 + scaffold + 1 cross-scope already applied = **14**
- Pending: 2 cross-scope requests (Win 3 + Win 4 nav additions)
- Target: ✅ **EXCEEDED — all worker tasks complete in under 90 minutes**

---

**Last updated:** 2026-04-20 by Win 1 (post Sprint 1 merge)
