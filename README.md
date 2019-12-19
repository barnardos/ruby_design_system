# Barnardos::RubyDesignSystem

Tools for appling Barnardo's Design System to Ruby projects.

The tools include helper methods and modification to simple form to make it Design System compliant.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'barnardos-ruby_design_system'
```

And then execute:

    $ bundle

### Installing PostCSS

The CSS used in the Design System requires processing in JavaScript space by PostCSS.

#### `/app/views/layouts/application.html.erb`

All CSS should be defined within the folder `app/javascript` so the `stylesheet_link_tag` declaration can be removed
from the application template. Also make sure that JavaScript is loaded here with `javascript_pack_tag`. For example:

```
  <%= javascript_pack_tag 'application' %>
```

#### `/package.json`

Update `package.json` to include declarations for PostCSS and related plugins.

Also while this file is being modified, add `@barnardos/components` which will make the Design System code
available.

For example:

```json
{
  "name": "my_app",
  "private": true,
  "dependencies": {
    "@barnardos/components": "^1.0.0",
    "@rails/actioncable": "^6.0.0-alpha",
    "@rails/activestorage": "^6.0.0-alpha",
    "@rails/ujs": "^6.0.0-alpha",
    "@rails/webpacker": "^4.0.7",
    "polyfill-nodelist-foreach": "^1.0.1",
    "postcss-browser-reporter": "^0.6.0",
    "postcss-import": "^12.0.1",
    "postcss-inline-svg": "^4.1.0",
    "postcss-preset-env": "^6.7.0",
    "postcss-reporter": "^6.0.1",
    "postcss-svgo": "^4.0.2"
  },
  "version": "0.1.0",
  "devDependencies": {
    "webpack-dev-server": "^3.9.0"
  }
}
```

#### `/postcss.config.js`

A PostCSS configuration file is also present. The following is an example that works with the Design System:

```javascript
module.exports = () => ({
  plugins: [
    require("postcss-import"),
    require("postcss-preset-env")({
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
    require("postcss-browser-reporter"),
    require("postcss-reporter")
  ]
});
```

#### `/app/javascript/packs/application.js`

For each Design System component you wish to use in the app, add a line to `application.js` in the form:

```javascript
import "@barnardos/components/src/components/<component name>/index.css";
```
For example:

```javascript
import "@barnardos/components/src/components/Footer/index.css";
import "@barnardos/components/src/components/Header/index.css";
import "@barnardos/components/src/components/Layout/index.css";
import "@barnardos/components/src/components/Link/index.css";
import "@barnardos/components/src/components/Main/index.css";
import "@barnardos/components/src/components/Paragraph/index.css";
import "@barnardos/components/src/components/Title/index.css";
```

This will load the associated CSS where it can be processed by PostCSS. The list of imports can get quite long, so
placing them in alphabetical order is a good idea as it makes them a little easier to manage.

#### Complete PostCSS installation

The following two commands will clear out the current Webpacker setup and install the requires elements:

```bash
rake webpacker:clobber
yarn
```

Then restart the server and the changes should take effect.

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/barnardos-ruby_design_system.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
