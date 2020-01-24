# frozen_string_literal: true

module Barnardos
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)
      DEV_PACKAGES = ['webpack-dev-server'].freeze
      PACKAGES = [
        '@barnardos/components',
        '@rails/actioncable',
        '@rails/activestorage',
        '@rails/ujs',
        '@rails/webpacker',
        'polyfill-nodelist-foreach',
        'postcss-browser-reporter',
        'postcss-import',
        'postcss-inline-svg',
        'postcss-preset-env',
        'postcss-reporter',
        'postcss-svgo'
      ].freeze

      def install
        directory 'inputs', 'app/inputs'
        directory 'helpers', 'app/helpers'

        `yarn add #{PACKAGES.join(' ')}`
        `yarn add #{DEV_PACKAGES.join(' ')} --dev`
        copy_file 'postcss.config.js', 'postcss.config.js'
        rake 'webpacker:clobber'
        `yarn`
      end
    end
  end
end
