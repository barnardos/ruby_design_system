# Barnardos::RubyDesignSystem

Tools for applying Barnardo's Design System to Ruby projects.

The tools include helper methods and modifications to simple_form to make it Design System compliant.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'barnardos-ruby_design_system'
```

And then execute:

    $ bundle

With the gem installed, a Rails generator is added that will set up the host app. To run the generator
execute the following at app root:

    $ rails g barnardos:install

Then restart the server and the changes should take effect.

Have a look at `lib/generators/barnardos/install_generator.rb` for the details of the generator's actions.

As an outline it does the following:

### Installs the barnardos components in the webpaker environment

These provide the CSS and JS needed for the components to work properly

### Installs PostCSS

The CSS used in the Design System requires processing in JavaScript space by PostCSS.

The file `package.json` is updated to include declarations for PostCSS and related plugins.

The PostCSS configuration file `/postcss.config.js` is copied to root

### Sets up simple form to work with the design system

A set of classes are inserted into `app/inputs`. These modify the rails input classes so that when used
with simple_form, they create components that match the design system.

### Adds `app/helpers/barnardos_design_system_helper.rb`

This helper contains the statement `include Barnardos::RubyDesignSystem::ComponentHelper` which makes the helper
method defined in this gem, available to the views in the host app.

## Using the components

### `/app/javascript/packs/application.js`

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/barnardos-ruby_design_system.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
