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

- [R] **W3-03** [win3] Write `agent-instructions/lead-architect-prompt.mdx` — role prompt template for Win 1. PR: `win3-workflow` branch.
- [R] **W3-04** [win3] Write `agent-instructions/worker-agent-prompt.mdx` — role prompt template for Win 2/3/4 (parameterized by scope). PR: `win3-workflow` branch.

### Win 4 — Reference & QA

- [ ] **W4-01** Write `scripts/pre-commit-check.sh` — bash script running 3 greps (`☐`, `<[0-9]`, missing frontmatter) + exit non-zero on any hit.
- [ ] **W4-02** Write `help-center/troubleshooting/mdx-gotchas.mdx` — catalog of MDX parse errors with fixes.
- [ ] **W4-03** Write `knowledge-qa/multi-agent-faq.mdx` — FAQ: "What if two agents claim the same task?", "How do I update documentation.json?", "What if pre-commit fails?".
- [ ] **W4-04** Run validation pass on all existing `.mdx` files → log any gotchas found in `plans/findings.md`.

---

## 🟡 IN-PROGRESS

---

## 🔵 REVIEW

- [R] **W3-01** [win3] Audit `workflows/content-workflow.mdx` — add Steps component, verify ties to Core Rules (cross-link). PR: `win3-workflow` branch.
- [R] **W3-02** [win3] Write `workflows/multi-agent-sprint-workflow.mdx` — 7-phase sprint protocol. PR: `win3-workflow` branch.

---

## 🟢 DONE

- [x] **W1-00** Scaffold CLAUDE.md, AGENTS.md, CODEOWNERS, plans/task-board.md, plans/progress.md, plans/findings.md — _Win 1, 2026-04-20_

---

## 📨 Cross-Scope Requests

_(Win 2/3/4: if you need to edit a file outside your scope, add an entry here — Win 1 will apply.)_

### [2026-04-20 00:19] [win3 → win1] Add new pages to documentation.json
Reason: Created 2 new workflows + 2 new agent-instructions pages — need nav entries.
Patch:
Add to `documentation.json` under workflows group:
  - path: "workflows/multi-agent-sprint-workflow", title: "Multi-Agent Sprint Workflow"
Add to `documentation.json` under agent-instructions group:
  - path: "agent-instructions/lead-architect-prompt", title: "Lead Architect Prompt (Win 1)"
  - path: "agent-instructions/worker-agent-prompt", title: "Worker Agent Prompt (Win 2/3/4)"
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
- Claimed: 4 (W3-01 → W3-04)
- In progress: 0
- Review: 4 (W3-01, W3-02, W3-03, W3-04)
- Done: 1 (scaffold)
- Target: All TODO → DONE by end of Sprint 1

---

**Last updated:** 2026-04-20 by Win 1
