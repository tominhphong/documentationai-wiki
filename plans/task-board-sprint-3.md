# Sprint 3 Task Board — documentationai-wiki

**Sprint:** 3
**Opened:** 2026-04-20 ~22:08 CDT
**Theme:** Polish + Discoverability
**Brain:** Opus 4.7 (orchestrator + Win 1 executor)
**Executors:** Win 2/3/4 Sonnet via Agent Team

**Protocol:** Brain owns this file, workers read-only. Commit with task ID tag. Cross-scope → `plans/cross-scope-sprint-3.md`.

---

## 🎯 Sprint 3 Goals

1. **`last_reviewed: YYYY-MM-DD` frontmatter** on all 45 content MDX files (SEO + maintenance signal)
2. **Fix nav gaps** — 4 help-center MDX missing từ documentation.json
3. **New content:** sprint-retro-workflow, expanded who-phong-is
4. **Tooling:** check-frontmatter.sh validator
5. **Automation:** changelog auto-append script (stretch)

---

## 📋 TASK POOL (7 tasks)

### 🧭 Win 1 — Brain (Opus)
- [ ] **S3-W1-01** Fix help-center nav — add 3 orphan paths (faq/getting-started, guides/setup-project, troubleshooting/install-error + mdx-gotchas if needed)
- [ ] **S3-W1-02** Apply Sprint 3 cross-scope requests + changelog update + sprint close

### 🏗️ Win 2 — Framework (Sonnet)
- [ ] **S3-W2-01** Add `last_reviewed: 2026-04-20` to all agent-os-overview/ + core-rules/ files (11 files)
- [ ] **S3-W2-02** Expand `agent-os-overview/who-phong-is.mdx` (74 → 150+) — Phong's real estate + content creator story

### 🔀 Win 3 — Workflow (Sonnet)
- [ ] **S3-W3-01** Add `last_reviewed` to all workflows/ + agent-instructions/ files (9 files)
- [ ] **S3-W3-02** Create `workflows/sprint-retro-workflow.mdx` — post-sprint retrospective process

### ✅ Win 4 — Reference & QA (Sonnet)
- [ ] **S3-W4-01** Add `last_reviewed` to help-center/ + knowledge-qa/ (7 files) + create `scripts/check-frontmatter.sh`
- [ ] **S3-W4-02** Sprint 3 QA pass + report `plans/qa-report-sprint-3.md`
