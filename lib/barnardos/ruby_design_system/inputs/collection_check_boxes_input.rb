# frozen_string_literal: true

module Barnardos
  module RubyDesignSystem
    module Inputs
      class CollectionCheckBoxesInput < SimpleForm::Inputs::CollectionCheckBoxesInput
        def input(wrapper_options = nil)
          input_html_classes.unshift('Switch-input')
          options[:item_label_class] = 'Switch-label'
          options[:item_wrapper_tag] = :div
          options[:item_wrapper_class] = 'Switches-item Switch Switch--checkbox'
          template.content_tag(:div, super, class: 'Switches-items')
        end
      end
    end
  end
end
