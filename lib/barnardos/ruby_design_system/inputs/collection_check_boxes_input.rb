# frozen_string_literal: true

module Barnardos
  module RubyDesignSystem
    module Inputs
      # Overrides behaviour of the collection check boxes input in simple_form forms.
      #
      # Usage:
      # Add the following class to the host project at app/inputs/collection_check_boxes_input.rb
      #
      #   class CollectionCheckBoxesInput < Barnardos::RubyDesignSystem::Inputs::CollectionCheckBoxesInput; end
      #
      # With that in place, the following code will output a set of collection boxes wrapped in the required
      # Design System components:
      #
      #    <%= simple_form_for(foo) do |form| %>
      #      <%= form.association :bars, as: :check_boxes, wrapper: :in_fieldset, boolean_style: :inline %>
      #    <% end %>
      #
      # Where `foo` has_many `bars`
      #
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
