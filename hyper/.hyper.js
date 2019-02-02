// See https://hyper.is#cfg for all options.

module.exports = {
  config: {
    fontFamily: 'Menlo, Monaco, "Courier New", monospace',
    fontSize: 14,
    cursorColor: "rgba(3, 169, 244, .8)",
    cursorAccentColor: "#000",
    foregroundColor: "#fff",
    backgroundColor: "#000",
    selectionColor: "rgba(255, 255, 255, .3)",
    borderColor: "#2196f3",
    padding: "12px 14px",
    bell: false,
    quickEdit: true,
    MaterialTheme: {
      accentColor: "#2196f3"
    },
    hypercwd: {
      initialWorkingDirectory: "~/projects"
    }
  },
  plugins: [
    "hyper-quit",
    "hyper-material-theme",
    "hyper-statusline",
    "hypercwd"
  ]
};
