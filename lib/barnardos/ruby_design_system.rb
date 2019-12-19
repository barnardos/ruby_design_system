require "barnardos/ruby_design_system/version"
require 'barnardos/ruby_design_system/component_helper'

module Barnardos
  module RubyDesignSystem
    class Error < StandardError; end

    require 'simple_form'
    Dir[File.join(__dir__, 'ruby_design_system/inputs', '*.rb')].each { |file| require file }

    require_relative 'ruby_design_system/simple_form'
  end
end
