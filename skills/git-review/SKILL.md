---
name: git-review
description: Review code changes, pull requests, or merge requests for bugs, code quality, security, and maintainability. Use when asked to review a PR, MR, diff, or set of changes. Also handles GitHub PRs and GitLab MRs.
---

## 1. Fetch the changes

If a GitHub PR URL or number is provided, fetch details and diff via `gh`:

```
gh pr view <number-or-url> --json title,body,additions,deletions,files,reviews,statusCheckRollup,headRefName,baseRefName
gh pr diff <number-or-url>
```

If `gh` cannot access the repository, a GitLab MR is referenced, or no URL is given, ask the user to paste the diff directly. A local diff also works:

```
git diff main...<branch>
```

## 2. Check CI status

If fetched via `gh`, check `statusCheckRollup`. If any checks are failing or still pending, inform the user and stop — do not review until CI is green.

## 3. Review the changes

Review the diff thoroughly and critically. Do not just validate what is there — look for what is wrong or missing.

Cover the following areas, skipping any that are not relevant:

- **Bugs and logic errors:** incorrect assumptions, edge cases, off-by-one errors, unhandled states
- **Code quality:** readability, naming, unnecessary complexity, duplication
- **Security:** injection risks, exposed secrets, improper input handling, unsafe defaults
- **Performance:** unnecessary work, inefficient patterns, missing caching where appropriate
- **Correctness:** does the implementation match the intent described in the title or description

Group feedback by file or concern. For each issue, state what the problem is and suggest a concrete fix. If something is genuinely good or well-handled, you may note it briefly, but focus on what needs attention.

Be direct. Do not soften criticism or add filler. If the changes look fine, say so plainly.

## 4. Post feedback

If the review was fetched via `gh` and there are issues, post a review comment:

```
gh pr review <number> --request-changes --body "..."
```

If the changes look good, say so and leave approval to the user.
