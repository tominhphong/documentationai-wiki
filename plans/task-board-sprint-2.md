# Sprint 2 Task Board — documentationai-wiki

**Sprint:** 2
**Opened:** 2026-04-20 ~11:05 CDT
**Lead Brain:** Opus 4.7 (main Claude Code CLI session — orchestrator)
**Executors:** Win 1/2/3/4 = Sonnet 4.6 (hands/tay chân)

**Protocol (Sprint 2 — simplified từ Sprint 1 lesson):**
- Win 1 owns this file — workers **read-only**
- Workers commit với task ID trong message (e.g. `feat(S2-W2-01): expand architecture`)
- Cross-scope requests → file riêng: `plans/cross-scope-sprint-2.md` (Win 1 merges)
- Progress tracked from `git log --grep="S2-W"` — no markdown conflict

**Legend:**
- `[ ]` TODO · `[>]` IN-PROGRESS · `[R]` REVIEW (Win 4 QA) · `[x]` DONE (merged)

---

## 🎯 Sprint 2 Theme

**"Depth + Automation"** — expand thin pages, add CI/link validation, fill missing workflow/reference pages.

**Goals:**
1. Zero MDX file under 100 lines in core content (agent-os-overview, core-rules, workflows, agent-instructions, knowledge-qa)
2. Add 5 new pages (debugging-workflow, review-workflow, cross-scope-workflow, communication-rules, glossary)
3. CI auto-validation on every PR
4. `last_reviewed` frontmatter on all content pages

---

## 📋 TASK POOL (16 tasks = 4/worker)

### 🧭 Win 1 — Lead Architect (Sonnet executor)
Scope: `documentation.json`, top-level `*.mdx`, `/plans/`, `.github/`, scripts orchestration

- [ ] **S2-W1-01** Create `.github/workflows/mdx-validate.yml` — CI runs `scripts/pre-commit-check.sh` + `scripts/check-links.sh` on PR
- [ ] **S2-W1-02** Expand `changelog.mdx` — add Sprint 1 entry + Sprint 2 placeholder + changelog template for future sprints
- [ ] **S2-W1-03** Apply Sprint 2 cross-scope requests from workers (update `documentation.json` with 5 new page nav entries)
- [ ] **S2-W1-04** Final merge + deploy verify — pull worker branches, merge, push main, verify MCP reindex

### 🏗️ Win 2 — Framework Author (Sonnet executor)
Scope: `agent-os-overview/`, `core-rules/`

- [ ] **S2-W2-01** Expand `agent-os-overview/architecture.mdx` (166 → 250+ lines) — add Mermaid diagram showing 4-agent + filesystem coordination loop
- [ ] **S2-W2-02** Expand `agent-os-overview/components-and-tools.mdx` (219 → 300+ lines) — add concrete examples per tool (Desktop Commander, MCP, Remotion, Zernio, Vbee)
- [ ] **S2-W2-03** Create `core-rules/communication-rules.mdx` — how agents "talk" (filesystem-based, no runtime IPC), cross-scope protocol, commit message conventions
- [ ] **S2-W2-04** Create `agent-os-overview/design-principles.mdx` — YAGNI/KISS/DRY + "filesystem as IPC" + "read before write" + "own file ownership"

### 🔀 Win 3 — Workflow Writer (Sonnet executor)
Scope: `workflows/`, `agent-instructions/`

- [ ] **S2-W3-01** Create `workflows/debugging-workflow.mdx` — khi agent gặp error: diagnosis flow, rollback, escalate to Win 1
- [ ] **S2-W3-02** Create `workflows/review-workflow.mdx` — Win 4 QA process, what to check, how to REJECT vs PASS, feedback loop
- [ ] **S2-W3-03** Create `workflows/cross-scope-workflow.mdx` — cách request change ngoài scope (template, example, turnaround time)
- [ ] **S2-W3-04** Expand `agent-instructions/claude-cowork-instructions.mdx` (144 → 200+ lines) — add concrete Cowork command examples

### ✅ Win 4 — Reference & QA (Sonnet executor)
Scope: `help-center/`, `knowledge-qa/`, `scripts/`, QA all workers

- [ ] **S2-W4-01** Create `knowledge-qa/glossary.mdx` — 30+ terms (Win, Lead, Worker, cross-scope, worktree, MDX, pre-commit, MCP, cowork, etc.) with anchors
- [ ] **S2-W4-02** Expand 3 help-center stubs — `faq/getting-started.mdx` (20 → 100+), `guides/setup-project.mdx` (20 → 120+), `troubleshooting/install-error.mdx` (26 → 100+)
- [ ] **S2-W4-03** Create `scripts/check-links.sh` — scan all `.mdx` for internal path refs, verify target exists, report broken links
- [ ] **S2-W4-04** Full Sprint 2 QA pass — run pre-commit + check-links on ALL worker branches BEFORE Win 1 merge, report in `plans/qa-report-sprint-2.md`

---

## 📨 Cross-Scope Requests → see `plans/cross-scope-sprint-2.md`

(Workers append requests there. Win 1 applies in S2-W1-03.)

---

## 🔗 Dependencies

- **S2-W4-03** (check-links.sh) is dependency for **S2-W4-04** — must ship first
- **S2-W1-01** (CI) depends on **S2-W4-03** existing in main
- **S2-W1-03** depends on ALL worker cross-scope requests submitted
- **S2-W1-04** is LAST — after all other tasks DONE

---

## ⏭️ Next Sprint (Sprint 3 candidates)

- SEO frontmatter audit (title/description/keywords per page)
- `last_reviewed: YYYY-MM-DD` on all pages (batched update after content stable)
- Video/image embeds for architecture + workflows
- Search/filter UX for Multi-Agent FAQ
- Redirect rules from old paths
