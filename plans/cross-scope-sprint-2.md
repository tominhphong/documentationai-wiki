# Sprint 2 Cross-Scope Requests

**Owner:** Win 1 (Lead) applies. Workers append requests below.

**Template:**

```
### [YYYY-MM-DD HH:MM] [winN → win1] Short title
Reason: ...
Patch / what to change:
- file: /path
- change: ...
Status: pending | applied (commit SHA)
```

---

## Pending

### [2026-04-20 14:27] [win3 → win1] Add cross-scope-workflow to nav
Patch:
- file: documentation.json
- change: Add `{"title": "Cross-Scope Workflow", "path": "workflows/cross-scope-workflow", "icon": "git-branch"}` vào group "Workflows"
Status: pending

## Applied

### [2026-04-20 12:55] [win3 → win1] Add debugging-workflow to nav
Reason: New page workflows/debugging-workflow.mdx cần add vào documentation.json under Workflows group.
Patch:
- file: documentation.json
- change: Add `{"title": "Debugging Workflow", "path": "workflows/debugging-workflow", "icon": "bug"}` vào group "Workflows"
Status: **applied** (commit 95907c2)

### [2026-04-20 13:14] [win3 → win1] Add review-workflow to nav
Reason: New page workflows/review-workflow.mdx
Patch:
- file: documentation.json
- change: Add `{"title": "Review Workflow", "path": "workflows/review-workflow", "icon": "check-square"}` vào group "Workflows"
Status: **applied**

### [2026-04-20 13:41] [win4 → win1] Add glossary to nav
Reason: New page knowledge-qa/glossary.mdx
Patch:
- file: documentation.json
- change: Add `{"title": "Glossary", "path": "knowledge-qa/glossary", "icon": "book-open"}` vào group "Knowledge & QA"
Status: **applied**
