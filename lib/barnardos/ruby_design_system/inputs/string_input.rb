# frozen_string_literal: true

module Barnardos
  module RubyDesignSystem
    module Inputs
      class StringInput < SimpleForm::Inputs::StringInput
      # Overrides behaviour of the string input in simple_form forms.
      #
      # Usage:
      # Add the following class to the host project at app/inputs/string_input.rb
      #
      #   class StringInput < Barnardos::RubyDesignSystem::Inputs::StringInput; end
      #
      # With that in place, the following code will output a text input wrapped in the required
      # Design System components:
      #
      #    <%= simple_form_for(foo) do |form| %>
      #      <%= form.input :bar %>
      #    <% end %>
      #
      # Where `bar` is a string attribute of `foo`
      #
        def input(wrapper_options = nil)
          input_html_classes.unshift('TextInput-input')
          super
        end
      end
    end
  end
end
