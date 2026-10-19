---
name: a11y-score
description: Turn a11y-audit findings into a weighted 0-10 score and tier, then display it as terminal text or a circular-gauge Artifact. Use after running a11y-audit, or whenever the user asks for an accessibility score, scorecard, or a comparison of scores across sites.
---

Use this after findings exist (from the `a11y-audit` skill run earlier in this conversation, or supplied directly). This skill does not browse — it scores and displays findings someone else already gathered.

If no findings exist yet for the site(s) in question, run `a11y-audit` first. Never fabricate findings to produce a score.

## 1. Score the findings

For each site, sum a penalty per finding by severity, then subtract from 10:

| Severity | Penalty |
|---|---|
| Critical (access-blocking) | -4 |
| Serious | -2 |
| Moderate | -1 |
| Minor | -0.3 |

`score = max(0, 10 - sum(penalties))`, rounded to 1 decimal.

Tier bands (same wording every time, used in the legend):
- **Good** — 8–10 — minor issues only
- **Needs work** — 6–7.9 — one or more serious issues
- **Critical** — below 6 — widespread, compounding issues

Tier colors: Good `#2fae59` (green), Needs work `#e3a53a` (amber), Critical `#ea6a63` (red/coral).

Note any caveat about what was actually audited (logged-out page, cookie banner open, a specific sub-page) — carry it into the footer note in either display mode. Never silently reuse a score from outside this session's own audit (a screenshot, a prior claim) without telling the user that's what's happening.

## 2. Pick terminal or Artifact

Default to **terminal**. Switch to **Artifact** only when both are true:
- the Artifact tool is actually available in this session, and
- the request implies a visual deliverable: the user says image, picture, slide(s), deck, PNG, share, or asks to compare more than one site's scores side by side.

If the user explicitly names one mode, use that. If Artifact is implied but the tool isn't available, use terminal and say so in one line rather than silently downgrading.

## 3. Terminal display

Plain text, no attempt at drawing a circle or bar. For one site:

```
<site> — <score>/10 (<tier>)

- [SERIOUS] <bold summary>. <one-sentence detail>.
- [MODERATE] <bold summary>. <one-sentence detail>.
- [MINOR] <bold summary>. <one-sentence detail>.

Score = 10 minus weighted penalties (Critical −4, Serious −2, Moderate −1, Minor −0.3).
```

For multiple sites where the user wants a quick comparison (not full findings per site), condense to one line each:

```
claude.ai           9.0  Good
perplexity.ai       8.0  Good
mistral.ai          2.7  Critical
```

Full per-site findings blocks still take precedence when the user asked for the audit detail, not just a leaderboard — use judgment on which the question actually calls for.

## 4. Artifact display

Reuse this exact design system — it's been validated across several runs. Dark card, no light/dark mode switching needed (this is a deliberately single-theme report graphic, not a UI the person will revisit):

```css
:root{
  --bg:#121212; --ink:#f3f3f1; --ink-muted:#9a9a97; --ink-faint:#6b6b68;
  --rule:#2a2a28; --track:#262624;
  --critical:#ea6a63; --good:#2fae59; --warn:#e3a53a;
  --font-head:'Libre Franklin',system-ui,sans-serif;
  --font-mono:'IBM Plex Mono',ui-monospace,monospace;
}
```
Load `Libre Franklin:wght@500;700;800` and `IBM Plex Mono:wght@400;500;700` from Google Fonts. Body is `#121212`, centered column, `max-width` 700–900px depending on ring count, 16px side gutter.

**Ring math** (don't re-derive by hand, this has bitten us before): for a ring of radius `r`, circumference `C = 2 * π * r`. For a score fraction `f = score/10`:
```
stroke-dasharray = C
stroke-dashoffset = C * (1 - f)
```
Draw the track circle first (`stroke: var(--track)`), then the score arc on top (`stroke: <tier color>`, `stroke-linecap: round`), with the `<svg>` rotated `-90deg` so the arc starts at 12 o'clock.

**Single site**: one ring, `r=74`, `stroke-width=14`, big `34px` tabular-mono score number centered inside (color = tier color), site name below in bold 16px. Findings listed below as a vertical list, each item: a severity chip (small, mono, uppercase, bordered, colored by severity: serious=red, moderate=amber, minor=muted gray) beside a bold summary + one-sentence detail. Close with the legend (all three tier dots, always show all three even if none apply this run) and the footer scoring-formula note.

**Multiple sites (2–6+)**: smaller rings, `r=64`, `stroke-width=13`, score number `30px`. Lay out 2–3 per row (flex, wrap) or a 3-column grid for 4–6. No severity tags on the rings themselves and no per-ring findings list — this view is a comparison/overview, not a full report. Just ring + site name under each. Keep the legend and footer note. If the user also wants the findings behind a specific site's number, give that as its own single-site artifact or in terminal text separately, don't cram it under the grid.

Don't add a tier badge/chip under each ring (tried it, it crowds the layout) — the arc color plus the shared legend is enough.

**Rendering and export**: write the HTML file, publish it as an Artifact normally. If the person wants a flat image (for slides, email, a design tool), open the same file in a fresh tab via the browser tool, resize the window narrower than the content's natural height (e.g. `400` for height) so `fullPage` screenshot auto-fits to content instead of stretching blank space, then screenshot to a `.png` in their Downloads folder. Take one look at the rendered screenshot before calling it done — ring arcs are easy to get backwards (check short scores render as short arcs, not long ones) and tag text can wrap.

## 5. Keep it honest

Scores from different runs of this skill are comparable with each other (same formula, same session's methodology) but are **not** necessarily comparable to a score from Lighthouse/PageSpeed or to numbers in a screenshot someone hands you — those use different methodologies (see the per-rule-pass/fail vs. per-finding distinction). Say so if it's likely to come up, don't let a side-by-side scorecard imply false precision across sources.
