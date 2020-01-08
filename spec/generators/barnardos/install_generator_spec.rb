require 'spec_helper'
require 'generator_spec'
require 'generators/barnardos/install_generator'

require 'tmpdir'

TMP_ROOT = Pathname.new('../../../tmp')


RSpec.describe Barnardos::Generators::InstallGenerator, type: :generator do
  # destination File.expand_path('../../../tmp', File.dirname(__FILE__))

  include GeneratorSpec::TestCase
  destination TMP_ROOT
  # setup :prepare_destination
  # teardown :cleanup_destination_root
  # arguments %w(something)

  before(:all) do
    FileUtils.rm_rf(TMP_ROOT)
    prepare_destination
    run_generator
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
  # it 'creates a test initializer' do
  #   assert_file 'postcss.config.js', 'require("postcss-reporter")'
  # end
end
