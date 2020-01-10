# frozen_string_literal: true

require 'barnardos/ruby_design_system/version'
require 'barnardos/ruby_design_system/component_helper'

module Barnardos
  # A Ruby module for easier working with Barnardos Design System
  module RubyDesignSystem
    class Error < StandardError; end

    require 'simple_form'
    Dir[File.join(__dir__, 'ruby_design_system/inputs', '*.rb')].each do |file|
      require file
    end

    require_relative 'ruby_design_system/simple_form'
  end
end
