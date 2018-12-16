// See https://hyper.is#cfg for all options.

module.exports = {
  config: {
    fontFamily: 'Menlo, Monaco, "Courier New", monospace',
    fontSize: 13,
    cursorColor: "rgba(3, 169, 244, .8)",
    cursorAccentColor: "#000",
    foregroundColor: "#fff",
    backgroundColor: "#000",
    selectionColor: "rgba(255, 255, 255, .3)",
    borderColor: "#333",
    padding: "12px 14px",
    bell: false,
    quickEdit: true
  },
  plugins: [
    "hyper-quit",
    "hyper-material-theme",
    "hyper-statusline",
    "hyper-hide-title"
  ]
};
