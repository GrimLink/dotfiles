---
name: git-review
description: Review code changes, pull requests, or merge requests for bugs, code quality, security, and maintainability. Use when asked to review a PR, MR, diff, or set of changes. Also handles GitHub PRs and GitLab MRs.
---

If a GitHub PR or issue URL is provided, or no diff is present, fetch the changes using the `gh` CLI:

```
gh pr view <number-or-url> --comments
gh pr diff <number-or-url>
```

If `gh` cannot access the repository, or a GitLab MR or any other source is referenced, ask the user to paste the diff directly. A local diff also works if the branch is available:

```
git diff main...<branch>
```

Review the provided code changes thoroughly and critically. Do not just validate what is there — look for what is wrong or missing.

Cover the following areas, skipping any that are not relevant:

- **Bugs and logic errors:** incorrect assumptions, edge cases, off-by-one errors, unhandled states
- **Code quality:** readability, naming, unnecessary complexity, duplication
- **Security:** injection risks, exposed secrets, improper input handling, unsafe defaults
- **Performance:** unnecessary work, inefficient patterns, missing caching where appropriate
- **Correctness:** does the implementation match the intent described in the title or description

Group feedback by file or concern. For each issue, state what the problem is and suggest a concrete fix. If something is genuinely good or well-handled, you may note it briefly, but focus on what needs attention.

Be direct. Do not soften criticism or add filler. If the changes look fine, say so plainly.
