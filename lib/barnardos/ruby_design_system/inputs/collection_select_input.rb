# frozen_string_literal: true

module Barnardos
  module RubyDesignSystem
    module Inputs
      class CollectionSelectInput < SimpleForm::Inputs::CollectionSelectInput
        def input(wrapper_options = nil)
          input_html_classes.unshift('Select')
          super
        end
      end
    end
  end
end
