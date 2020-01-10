require "bundler/setup"
require "barnardos/ruby_design_system"
require 'nokogiri'
require 'faker'
require 'action_controller'
require 'action_view'
require 'active_model'
require_relative 'support/dummy_model'

RSpec.configure do |config|

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  config.before(:example, type: :inputs) do
    allow_any_instance_of(ActionView::Base).to receive(:polymorphic_path).and_return('/somewhere')
    allow_any_instance_of(ActionView::Helpers::FormTagHelper).to receive(:extra_tags_for_form).and_return('')
  end

  def helper
    ActionController::Base.helpers
  end

  def with_concat_form_for(*args, &block)
    helper.simple_form_for(*args, &(block || proc {}))
  end

  def with_input_for(object, attribute_name, type, options = {})
    with_concat_form_for(object) do |f|
      f.input(attribute_name, options.merge(as: type))
    end
  end

  def html
    @html ||= Nokogiri::HTML(subject)
  end
end
