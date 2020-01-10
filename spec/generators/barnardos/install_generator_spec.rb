# frozen_string_literal: true

require 'spec_helper'
require 'generator_spec'
require 'generators/barnardos/install_generator'

RSpec.describe Barnardos::Generators::InstallGenerator, type: :generator do
  include GeneratorSpec::TestCase
  destination '.'

  before(:all) do
    run_generator
  end

  after(:all) do
    FileUtils.rm_rf('node_modules')
    FileUtils.rm('package.json')
    FileUtils.rm('postcss.config.js')
    FileUtils.rm('yarn.lock')
  end

  specify do
    expect(destination_root).to have_structure {
      directory '.' do
        file 'postcss.config.js' do
          contains 'require("postcss-reporter")'
        end
        file 'package.json' do
          contains '@barnardos/components'
        end
      end
    }
  end
end
