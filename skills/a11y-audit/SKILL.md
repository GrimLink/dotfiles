---
name: a11y-audit
description: Run an accessibility audit on a web page using a browser. Use when the user wants to check, test, or audit accessibility (a11y) on a URL or the current page.
---

Use the browser (via the Chrome/Playwright MCP) to audit the page for accessibility issues. Follow the steps below in order.

## 1. Navigate and baseline

1. Navigate to the page with `navigate_page`
2. Run `list_console_messages` with `types: ["issue"]` and `includePreservedMessages: true` to catch native Chrome accessibility issues (missing labels, invalid ARIA, low contrast)

## 2. Structure and semantics

1. Run `take_snapshot` to capture the accessibility tree
2. Check heading hierarchy (h1 > h2 > h3, no skipped levels)
3. Verify landmark regions are present (main, nav, header, footer)
4. Check page `<title>` is present and free of typos
5. Compare snapshot order against a `take_screenshot` to confirm DOM order matches visual reading order

## 3. Labels, images, and forms

Using the snapshot:

- Buttons and links must have an accessible name (not empty)
- Images must have meaningful `alt` text, decorative images use `alt=""`
- Form inputs must have associated labels — verify with `evaluate_script`:
  ```js
  [...document.querySelectorAll('input, select, textarea')]
    .filter(el => !el.labels?.length && !el.getAttribute('aria-label') && !el.getAttribute('aria-labelledby'))
    .map(el => el.outerHTML)
  ```

## 4. Keyboard navigation

1. Press `Tab` and take a snapshot — locate the focused element in the tree
2. Continue tabbing through key interactive elements to verify logical focus order
3. If a modal or dialog is present, verify focus is trapped inside it
4. Take a `take_screenshot` to confirm focus indicator is visible

## 5. Color contrast

Check `list_console_messages` output for "Low Contrast" issues first. If the environment does not report them, use `evaluate_script` to check a specific element manually:

```js
const el = document.querySelector('SELECTOR');
const style = getComputedStyle(el);
[style.color, style.backgroundColor]
```

## 6. ARIA

Using the snapshot, verify:

- No ARIA roles that duplicate native semantics (e.g., `<button role="button">`)
- No `aria-label` on elements that already have visible text
- No invalid role values or misuse of `aria-hidden` on focusable elements

## Report

Group findings by severity:

- **Critical** — blocks access entirely
- **Serious** — significantly impairs access
- **Moderate** — causes confusion or extra effort
- **Minor** — small improvements, including typos in visible or `<title>` text

For each issue: element or selector, what is wrong, and the fix.

When the audit is complete, close the page with `close_page`.
