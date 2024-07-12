module.exports = {
  dryRun: false,
  plugins: [
    [
      "@semantic-release/commit-analyzer",
      {
        preset: "angular",
        releaseRules: [
          { breaking: true, release: "major" },
          { type: "feat", release: "minor" },
          { type: "fix", release: "patch" },
          { type: "style", release: false },
          { type: "refactor", release: false },
          { type: "perf", release: "patch" },
          { type: "revert", release: "patch" },
          { type: "chore", scope: "port*", release: "patch" },
          { type: "build", release: false },
          { type: "ci", release: false },
          { type: "docs", release: false },
          { type: "test", release: false },
        ],
        parseOpts: {
          noteKeywords: ["BREAKING CHANGE", "BREAKING CHANGES", "BREAKING"]
        },
      },
    ],
    [
      "@semantic-release/release-notes-generator",
      {
        preset: "conventionalcommits",
        presetConfig: {
          types: [
            { type: "feat", section: "Features" },
            { type: "fix", section: "Bug Fixes" },
            { type: "style", section: "Style" },
            { type: "refactor", section: "Refactor" },
            { type: "perf", section: "Performance" },
            { type: "revert", section: "Reverts" },
            { type: "chore", scope: "port*", section: "Ports" },
            { type: "chore", section: "Chores" },
            { type: "build", section: "Build" },
            { type: "ci", section: "CI" },
            { type: "docs", section: "Docs" },
            { type: "test", section: "Tests" },
          ],
        },
        parserOpts: {
          noteKeywords: ["BREAKING CHANGE", "BREAKING CHANGES", "BREAKING"]
        },
      },
    ],
    "@semantic-release/github",
  ],
};
