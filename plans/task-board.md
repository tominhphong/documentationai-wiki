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

- [ ] **W3-01** Audit `workflows/content-workflow.mdx` — add Steps component, verify ties to Core Rules (cross-link).
- [ ] **W3-02** Write `workflows/multi-agent-sprint-workflow.mdx` — new page. Scope: how to run a 4-agent sprint (claim → work → review → merge → deploy). Reference CLAUDE.md and AGENTS.md.
- [ ] **W3-03** Write `agent-instructions/lead-architect-prompt.mdx` — role prompt template for Win 1.
- [ ] **W3-04** Write `agent-instructions/worker-agent-prompt.mdx` — role prompt template for Win 2/3/4 (parameterized by scope).

### Win 4 — Reference & QA

- [ ] **W4-01** Write `scripts/pre-commit-check.sh` — bash script running 3 greps (`☐`, `<[0-9]`, missing frontmatter) + exit non-zero on any hit.
- [ ] **W4-02** Write `help-center/troubleshooting/mdx-gotchas.mdx` — catalog of MDX parse errors with fixes.
- [ ] **W4-03** Write `knowledge-qa/multi-agent-faq.mdx` — FAQ: "What if two agents claim the same task?", "How do I update documentation.json?", "What if pre-commit fails?".
- [ ] **W4-04** Run validation pass on all existing `.mdx` files → log any gotchas found in `plans/findings.md`.

---

## 🟡 IN-PROGRESS

_(empty)_

---

## 🔵 REVIEW

### Win 2 — Framework Author

- [R] **W2-01** [win2] Expanded `agent-os-overview/introduction.mdx` — added "Tại sao hệ thống này tồn tại" section
- [R] **W2-02** [win2] Created `agent-os-overview/multi-agent-collaboration.mdx` — 4-agent model, file ownership, task flow, cross-scope protocol
- [R] **W2-03** [win2] Expanded `core-rules/global-operating-rules.mdx` — added Luật 7 (YAGNI/KISS/DRY) with Phong workflow examples
- [R] **W2-04** [win2] Created `core-rules/file-ownership-rules.mdx` — ownership map, cross-scope request flow, conflict resolution

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

---

## 📊 Sprint 1 Burn-Down

- Total tasks: 12 (4 per worker)
- Claimed: 0
- In progress: 0
- Done: 1 (scaffold)
- Target: All TODO → DONE by end of Sprint 1

---

**Last updated:** 2026-04-20 by Win 1
