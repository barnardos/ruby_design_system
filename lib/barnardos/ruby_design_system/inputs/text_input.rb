# frozen_string_literal: true

module Barnardos
  module RubyDesignSystem
    module Inputs
      class TextInput < SimpleForm::Inputs::TextInput
        def input(wrapper_options = nil)
          input_html_classes.unshift('TextArea-textarea')
          super
        end
      end
    end
  end
end
