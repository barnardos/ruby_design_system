# frozen_string_literal: true

module Barnardos
  module RubyDesignSystem
    module Inputs
      class StringInput < SimpleForm::Inputs::StringInput
        def input(wrapper_options = nil)
          input_html_classes.unshift('TextInput-input')
          super
        end
      end
    end
  end
end
