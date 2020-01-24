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
    FileUtils.rm_rf('app/inputs')
    FileUtils.rm_rf('app/helpers')
    FileUtils.rm('package.json')
    FileUtils.rm('postcss.config.js')
    FileUtils.rm('yarn.lock')
  end

  it 'copies JavaScript configuration files to app root' do
    expect(destination_root).to have_structure {
      directory '.' do
        file 'postcss.config.js' do
          contains 'require("postcss-reporter")'
          contains 'require("postcss-inline-svg")'
        end
        file 'package.json' do
          contains '@barnardos/components'
        end
      end
    }
  end

  it 'copies inputs into app folder' do
    expect(destination_root).to have_structure {
      directory 'app/inputs' do
        file 'collection_check_boxes_input.rb' do
          contains 'CollectionCheckBoxesInput < Barnardos::RubyDesignSystem::Inputs::CollectionCheckBoxesInput'
        end
        file 'collection_select_input.rb'
        file 'string_input.rb'
        file 'text_input.rb'
      end
    }
  end

  it 'copies helper into app/helpers' do
    expect(destination_root).to have_structure {
      directory 'app/helpers' do
        file 'barnardos_design_system_helper.rb' do
          contains 'include Barnardos::RubyDesignSystem::ComponentHelper'
        end
      end
    }
  end
end
