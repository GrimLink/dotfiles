// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    updateChannel: "stable",
    fontFamily: 'Menlo, Monaco, "Courier New", monospace',
    fontSize: 16,
    padding: "12px 14px",
    bell: false,
    quickEdit: true,
    hypercwd: {
      initialWorkingDirectory: "~/projects",
    },
  },
  plugins: ["hyper-quit", "hypercwd", "hyper-snazzy"],
};
