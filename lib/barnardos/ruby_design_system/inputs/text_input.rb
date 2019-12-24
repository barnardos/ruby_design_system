# frozen_string_literal: true

module Barnardos
  module RubyDesignSystem
    module Inputs
      # Overrides behaviour of the text input in simple_form forms.
      #
      # Usage:
      # Add the following class to the host project at app/inputs/text_input.rb
      #
      #   class StringInput < Barnardos::RubyDesignSystem::Inputs::TextInput; end
      #
      # With that in place, the following code will output a textarea wrapped in the required
      # Design System components:
      #
      #    <%= simple_form_for(foo) do |form| %>
      #      <%= form.input :bar %>
      #    <% end %>
      #
      # Where `bar` is a text attribute of `foo`
      #
      class TextInput < SimpleForm::Inputs::TextInput
        def input(wrapper_options = nil)
          input_html_classes.unshift('TextArea-textarea')
          super
        end
      end
    end
  end
end
