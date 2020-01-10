module.exports = () => ({
  plugins: [
    require("./node_modules/postcss-import"),
    require("./node_modules/postcss-preset-env")({
      autoprefixer: {},
      features: {
        "focus-within": true,
        "nesting-rules": true,
        "color-mod-function": {
          unresolved: "warn"
        },
        "custom-properties": {
          preserve: false,
          warnings: true
        }
      }
    }),
    require("./node_modules/postcss-browser-reporter"),
    require("./node_modules/postcss-reporter")
  ]
});