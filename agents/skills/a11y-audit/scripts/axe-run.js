// Body for the Chrome DevTools MCP `evaluate_script`, not a standalone module.
// target-size (SC 2.5.8) ships disabled in axe and only runs when named here.
await import('https://cdn.jsdelivr.net/npm/axe-core@4/axe.min.js');
const r = await axe.run(document, {
  runOnly: { type: 'tag', values: ['wcag2a','wcag2aa','wcag21a','wcag21aa','wcag22aa'] },
  rules: { 'target-size': { enabled: true } },
});
return { violations: r.violations, incomplete: r.incomplete };
