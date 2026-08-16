---
name: a11y-audit
description: "Run a WCAG accessibility audit on a web page. Checks heading hierarchy, landmark regions, colour contrast, ARIA attributes, keyboard navigation, target size and the WCAG 2.2 additions. Use when the user wants to check, test, or audit accessibility (a11y) on a URL or the current page."
---

Audit the page with the Chrome DevTools MCP. Work through the steps in order.

If the user did not name a target, assume **WCAG 2.2 Level AA** and say so in the report.

If the Chrome DevTools MCP tools are not available, stop and tell the user to install it rather than substituting a scripted browser. Hand-rolled probes are where false positives come from.

The server is [chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp), launched with `npx -y chrome-devtools-mcp@latest`. Registration differs per agent, so point the user at their own MCP configuration rather than naming a command.

Register it with its full tool set. `--slim` exposes three tools and drops `take_snapshot` and `list_console_messages`, which this skill depends on.

## 1. Baseline

1. `navigate_page` to the URL.
2. `list_console_messages` with `types: ["issue"]` and `includePreservedMessages: true` for Chrome's own accessibility issues.
3. Run `scripts/axe-run.js` through `evaluate_script`. This is the cheapest high-value pass and catches most mechanical failures.

Report `incomplete` separately from `violations`: those are "needs review", not failures, and they are where the real findings usually hide.

Repeat for each page type that matters (home, listing, detail, form, checkout). One page is not an audit.

## 2. Structure and semantics

1. `take_snapshot` for the accessibility tree.
2. Heading hierarchy: one `h1`, no skipped levels, no empty headings.
3. Landmarks present (`main`, `nav`, `header`, `footer`) and each repeated landmark uniquely named.
4. `<title>` present, descriptive, free of typos.
5. `html[lang]` set.
6. Compare snapshot order against `take_screenshot` to confirm DOM order matches visual reading order.
7. Resolve every `aria-labelledby` and `aria-describedby` target. A dangling or empty reference leaves the element unnamed and axe only reports it as incomplete.

## 3. Labels, images, forms

From the snapshot, confirm buttons and links have a non-empty accessible name, and that images have meaningful `alt` (or `alt=""` when decorative).

Read names from the **accessibility tree**, not by hand-assembling attributes. A control can be named by a nested `role="img"` with `aria-label`, by an `<svg><title>`, or by `aria-labelledby`. Reconstructing that yourself produces phantom "unnamed control" findings.

Check `autocomplete` on every field (SC 1.3.5, and SC 3.3.8 for credentials) with `scripts/form-fields.js`.

`autocomplete="off"` on username or password fields fails SC 3.3.8. Generic labels such as "Form field" fail SC 3.3.2.

## 4. Keyboard and focus

Drive the keyboard with the MCP's own `click` and `press_key`. **Never open a menu or dialog with `element.click()` inside `evaluate_script`.** A synthetic click does not focus the trigger, so the component captures `document.body` as the element to restore, and the page appears to lose focus on close when it does not. That is a bug in the test, not the page.

1. Tab through and confirm focus order is logical and the indicator is visible (`take_screenshot`).
2. Confirm no keyboard traps, and that Escape closes overlays and returns focus to the trigger.
3. For dialogs, check what kind it is before judging it:

```js
const d = document.querySelector('dialog');
return { modal: d?.matches(':modal'), open: d?.open };
```

A native `<dialog>` opened with `showModal()` already provides focus trapping, background inertness and top-layer placement. Do **not** report missing `aria-modal` or a missing `inert` attribute for one. Adding `aria-modal` there is redundant and discouraged. Check the accessibility tree for `modal: true` and for the dialog's name, which is the part that genuinely does get missed.

## 5. Colour contrast

Trust axe's `color-contrast` result first. When resolving a value yourself, **never parse the string returned by `getComputedStyle`**. Modern themes use `oklch()` and `color-mix()`, which are returned verbatim, and reading the numbers out of them as RGB produces nonsense ratios. Use `scripts/contrast.js`, which resolves through a canvas instead.

Composite semi-transparent backgrounds against what is actually behind them. For text over a photo, sample the image's darkest and lightest pixels and check the worst case.

Also check SC 1.4.11 Non-text Contrast at 3:1, which axe does not cover at all: form control borders, focus rings, icon-only buttons and toggle states.

## 6. ARIA

- No roles duplicating native semantics (`<button role="button">`).
- No `aria-label` or `aria-labelledby` on a generic `<div>` or `<span>`, where naming is prohibited and the name is discarded.
- No `aria-hidden` on focusable elements.
- Before flagging an `aria-live` region as noisy, check `aria-atomic` and `aria-relevant` and whether anything announceable actually changes. With both unset, only added nodes and text changes announce, never the whole region, and a CSS scroll-snap carousel changes `scrollLeft` rather than the DOM. Confirm with a `MutationObserver` over a real interaction before reporting.

## 7. WCAG 2.2 additions

Automation covers almost none of these. Check each explicitly and say which passed.

| Criterion | Level | How to check |
| --- | --- | --- |
| 2.4.11 Focus Not Obscured (Min) | AA | Tab while scrolled and confirm no sticky or fixed element covers the focused control |
| 2.5.7 Dragging Movements | AA | Every drag action has a single-pointer alternative |
| 2.5.8 Target Size (Min) | AA | 24x24 CSS px, or the spacing exception below |
| 3.2.6 Consistent Help | A | Help or contact mechanism in the same relative order on every page |
| 3.3.7 Redundant Entry | A | No information asked for twice in one process |
| 3.3.8 Accessible Authentication (Min) | AA | Password managers can fill: `autocomplete` set, paste not blocked |

For SC 2.5.8, a target under 24x24 still passes if a 24px diameter circle centred on it intersects no other target's circle. Measure centre-to-centre distance before reporting, since most undersized targets pass this way. Note when the margin is thin so it does not regress later.

Check reflow (SC 1.4.10) and resize (SC 1.4.4) with `resize_page` to 320px wide and confirm no horizontal page scroll. An internally scrolling carousel is allowed.

## 8. Verify before reporting

Re-test every finding by a second, different method before it goes in the report. A DOM attribute reading is not evidence of runtime behaviour. Most false positives come from inferring behaviour from static markup rather than observing it.

State what you did not test. No screen reader, no authenticated pages, no alternative themes.

Close the page with `close_page` when done.

## Report

Group by severity: **Critical** (blocks access), **Serious** (significantly impairs), **Moderate** (confusion or extra effort), **Minor**.

For each issue give the criterion and level, the selector or element, the measured evidence, and the fix. Mark anything that passes under WCAG 2.1 but fails under 2.2 explicitly, since that is the usual reason for a re-audit.

List what was verified as passing too. A bare list of failures tells the reader nothing about coverage.

Keep it to the findings. Audit process narration belongs in the conversation, not the report.
