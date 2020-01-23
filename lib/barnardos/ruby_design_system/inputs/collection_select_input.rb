# frozen_string_literal: true

module Barnardos
  module RubyDesignSystem
    module Inputs
      # Overrides behaviour of the collection select input in simple_form forms.
      #
      # Usage:
      # Add the following class to the host project at app/inputs/collection_select_input.rb
      #
      #   class CollectionSelectInput < Barnardos::RubyDesignSystem::Inputs::CollectionSelectInput; end
      #
      # With that in place, the following code will output an HTML select input with class `Select` and wrapped in the
      # required Design System components:
      #
      #    <%= simple_form_for(foo) do |form| %>
      #      <%= form.association :bars, wrapper: :design_system_select %>
      #    <% end %>
      #
      # Where `foo` has_many `bars`
      #
      class CollectionSelectInput < SimpleForm::Inputs::CollectionSelectInput
        def input(wrapper_options = nil)
          input_html_classes.unshift('Select')
          super
        end
      end
    end
  end
end
