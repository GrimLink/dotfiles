// Body for the Chrome DevTools MCP `evaluate_script`, not a standalone module.
// Inventory only. Judge the accessible name from the accessibility tree, since
// `labelled` here misses names that come from a nested role="img" or <svg><title>.
return [...document.querySelectorAll('input,select,textarea')]
  .filter(el => el.type !== 'hidden')
  .map(el => ({
    name: el.name, type: el.type,
    labelled: !!(el.labels?.length || el.getAttribute('aria-label') || el.getAttribute('aria-labelledby')),
    autocomplete: el.getAttribute('autocomplete'),
  }));
