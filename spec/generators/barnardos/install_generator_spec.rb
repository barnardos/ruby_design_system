require 'spec_helper'
require 'generator_spec'
require 'generators/barnardos/install_generator'

RSpec.describe Barnardos::Generators::InstallGenerator, type: :generator do
  destination File.expand_path("../../../tmp", File.dirname(__FILE__))
  teardown :cleanup_destination_root
  # arguments %w(something)

  before(:all) do
    prepare_destination
    run_generator
  end

  # specify do
  #   expect(destination_root).to have_structure {
  #     directory '.' do
  #       file 'postcss.config.js' do
  #         contains 'require("postcss-reporter")'
  #       end
  #       file 'package.json' do
  #         contains '@barnardos/components'
  #       end
  #     end
  #   }
  # end
  it 'creates a test initializer' do
    assert_file 'postcss.config.js', 'require("postcss-reporter")'
  end
end

# class InstallGeneratorSpec < Rails::Generators::TestCase
#   tests Barnardos::Generators::InstallGenerator
#   destination File.expand_path("../../../tmp", File.dirname(__FILE__))
#   teardown :cleanup_destination_root

#   test "database.yml is not created when skipping Active Record" do
#     run_generator
#     assert_no_file "config/database.yml"
#   end
# end