# CLAUDE.md — documentationai-wiki

**Repo:** `tominhphong/documentationai-wiki`
**Purpose:** Public wiki documenting Phong's Agent OS — how AI agents (Claude Code CLI, subagents, MCPs) orchestrate real-estate + content workflows.
**Platform:** Documentation.AI (MDX-based, git-push → auto-deploy 30–60s)
**Live URL:** Resolved via Documentation.AI project link (check dashboard)
**MCP endpoint:** `https://antigravity-memory-palace.documentationai.com/_mcp` (tool: `search_documentation`)

---

## 🧭 Identity

This wiki is NOT a Realtor KB (that's `documentationai-documentation`). This is the **meta-layer** — documenting the **Agent OS** itself: rules, workflows, agent prompts, tool usage, FAQ. Audience: Phong + teammates + AI agents reading the wiki to self-orient.

**Sister repos (3-site Documentation.AI ecosystem):**
- `tominhphong/documentationai-wiki` → **Agent OS** at antigravity-memory-palace.documentationai.com (this repo — meta-layer)
- `tominhphong/documentationai-documentation` → **RKB** at phong-to.documentationai.com (real estate domain knowledge)
- `tominhphong/documentationai-guide` → **Realtor OS Wiki** at realtor-os.documentationai.com (technical reference for `claude-code-real-estate-framework`)

DO NOT confuse the 3. Routing rules: see `knowledge-qa/documentation-mcp-usage.mdx`.

---

## 👥 Multi-Agent Orchestration (REQUIRED READ)

This repo is worked on by a **4-agent team**. Before any edit, read:

1. [`AGENTS.md`](./AGENTS.md) — Role definitions (Win 1 Lead / Win 2 Framework / Win 3 Workflow / Win 4 Reference-QA)
2. [`CODEOWNERS`](./CODEOWNERS) — File ownership per agent. Never edit files outside your scope.
3. [`plans/task-board.md`](./plans/task-board.md) — Kanban. Claim tasks before work; update status in real-time.

**Golden rule:** File ownership is strict. If you need to touch a file outside your scope, write a **patch suggestion** in `plans/task-board.md` under "Cross-scope requests" — Lead (Win 1) applies.

---

## 🔒 5 Core Rules (NON-NEGOTIABLE)

1. **Read 3 tracking files before ANY task:** `plans/task-board.md`, `plans/findings.md` (if exists), `plans/progress.md` (if exists).
2. **Update `plans/progress.md`** after EVERY task completion — append `[YYYY-MM-DD HH:MM] [winN] <what was done>`.
3. **Stay in your file-ownership scope** — see [`CODEOWNERS`](./CODEOWNERS). Out-of-scope = cross-scope request, not direct edit.
4. **Run pre-commit validation** before push — see [`scripts/pre-commit-check.sh`](./scripts/pre-commit-check.sh) (Win 4 owns this script).
5. **Each work session must output ≥1 `.mdx` page OR 1 improvement** — no empty commits.

---

## 📝 MDX Gotchas (Documentation.AI specific)

1. **Unicode checkbox breaks render** — `☐`, `□` render as empty squares. Use `- [ ]` markdown or text.
2. **`<NUMBER%>` parsed as JSX** — `<20%` fails. Rephrase: `"under 20%"` or `"dưới 20%"`.
3. **Frontmatter mandatory** — every `.mdx` must start with:
   ```yaml
   ---
   title: "Page Title"
   description: "Short SEO/preview description"
   ---
   ```
4. **Path in `documentation.json` must match filename** — no `.mdx` extension in JSON path.
5. **Build is all-or-nothing** — 1 file syntax error → entire site fails to deploy. Test locally OR rely on Win 4 QA.
6. **Vietnamese full diacritics mandatory** — never `"phong ngu"`, always `"phòng ngủ"`.
7. **Component whitelist:** `Callout`, `Steps`, `Tabs`, `Columns`, `Card`, code blocks, tables. NOT supported: `CardGroup`, `Accordion`, Mermaid.

---

## 🔗 MCP Integration — antigravity-memory-palace

The wiki is queryable via MCP tool `search_documentation`:

```bash
claude mcp add --transport http antigravity-memory-palace \
  https://antigravity-memory-palace.documentationai.com/_mcp --scope user
```

**Tool signature:**
```
search_documentation(query: string, limit?: number, semanticRatio?: number) → { results: [...], count: number }
```

**Use cases for agents:**
- Before writing a page, search for existing related content to avoid duplication.
- When reviewing, verify cross-references exist.
- When answering QA, search source-of-truth rather than hallucinating.

**Self-reference:** This wiki documents its own MCP usage in [`knowledge-qa/documentation-mcp-usage.mdx`](./knowledge-qa/documentation-mcp-usage.mdx).

---

## 🏗️ Content Conventions

- **File naming:** kebab-case (e.g., `client-follow-up-workflow.mdx`)
- **Folder structure:** flat within each module (no deep nesting beyond 1 level)
- **Frontmatter fields:**
  - `title` (required) — display title
  - `description` (required) — 1-line summary for SEO/search
  - `icon` (optional) — Lucide icon name
  - `last_reviewed` (recommended) — `YYYY-MM-DD` for staleness tracking
- **Headings:** start at `##` (H1 comes from frontmatter `title`)
- **Language priority:** English for shared/public docs, Vietnamese acceptable for Phong-specific playbooks

---

## 🚀 Deployment

Auto-deploy on push to `main`:
1. Agent creates PR from worktree branch (e.g., `win2-framework`)
2. Win 1 (Lead) reviews + merges to `main`
3. Documentation.AI rebuilds in 30–60s
4. Win 4 (QA) verifies live + updates `plans/progress.md`

**Manual push (emergency):** Win 4 runs `scripts/pre-commit-check.sh` → `git push origin main`.

---

## 📂 Repo Structure (reference)

```
documentationai-wiki/
├── CLAUDE.md               ← this file
├── AGENTS.md               ← role definitions
├── CODEOWNERS              ← file ownership per agent
├── plans/
│   ├── task-board.md       ← kanban (claim → in-progress → done)
│   ├── progress.md         ← append-only activity log
│   └── findings.md         ← gotchas, insights, decisions
├── scripts/
│   └── pre-commit-check.sh ← Win 4 validation script
├── agent-os-overview/      ← Win 2 scope
├── core-rules/             ← Win 2 scope
├── workflows/              ← Win 3 scope
├── agent-instructions/     ← Win 3 scope
├── help-center/            ← Win 4 scope
├── knowledge-qa/           ← Win 4 scope
├── components/             ← shared (Lead only)
├── documentation.json      ← navigation (Lead only)
├── openapi.yaml            ← API spec (Lead only)
└── *.mdx                   ← top-level pages (Lead only)
```

---

## ✅ Before You Start Any Task

- [ ] Read this file (CLAUDE.md)
- [ ] Read [`AGENTS.md`](./AGENTS.md) — confirm your role
- [ ] Read [`CODEOWNERS`](./CODEOWNERS) — confirm your scope
- [ ] Read [`plans/task-board.md`](./plans/task-board.md) — claim a task
- [ ] Work on your worktree branch (`win2-framework` / `win3-workflow` / `win4-reference-qa`)
- [ ] Commit with conventional format (`feat:`, `fix:`, `docs:`, `refactor:`)
- [ ] Append to `plans/progress.md` after every task
- [ ] Push PR → notify Win 1 (Lead) via task-board update

---

**Last updated:** 2026-04-20 by Win 1 (Lead Architect, Opus 4.7)
