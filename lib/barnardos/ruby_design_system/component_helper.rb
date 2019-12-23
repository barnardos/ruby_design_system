module Barnardos
  module RubyDesignSystem
    # Provides helper methods available in the host app's server.
    #
    # Usage: Add the following to `/app/helpers/application_helper.rb` within the module `ApplicationHelper`:
    #
    #   include Barnardos::RubyDesignSystem::ComponentHelper
    #
    module ComponentHelper

      # Creates a ProminentLink Component.
      #
      # @param name [String] Link text that appears on page
      # @param options Same as `link_to` see {https://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-link_to Rails API}
      # @param html_options [Hash] Also same as `link_to` with additional option `colour` which sets the ProminentLink colour
      # @return [String] HTML anchor with class `ProminentLink` and optionally `ProminentLink--<colour>` if colour entered
      def prominent_link(name = nil, options = nil, html_options = {}, &block)
        colour = html_options.delete(:colour)
        colour_class = colour && "ProminentLink--#{colour}"
        html_options[:class] = [html_options[:class], 'ProminentLink', colour_class].flatten.compact
        link_to(name, options, html_options, &block)
      end

      # Creates a SkipLink Component
      #
      # @param text [String] Link text that appears on page
      # @param anchor [String] the anchor name that is the target for the skip link
      # @return [String] HTML anchor with class `SkipLink`
      def skip_link(text, anchor: '#main-anchor')
        link_to text, anchor, class: 'SkipLink'
      end

      # Creates a Link Component
      #
      # All parameters are as `link_to` see {https://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-link_to Rails API}
      # @return [String] HTML anchor with class `Link`
      def link(name = nil, options = nil, html_options = {}, &block)
        html_options[:class] = [html_options[:class], 'Link'].flatten.compact
        link_to(name, options, html_options, &block)
      end

      # Overrides the Rails helper method `link_to`
      # Adds the `html_options` option `new_window` which changes the link so that it will link to a new window
      # @return [String] HTML anchor with `target` set as `_blank` if html_options include `new_window: true`
      def link_to(name = nil, options = nil, html_options = {}, &block)
        html_options[:target] = '_blank' if html_options.delete(:new_window)
        super
      end

      # Creates a FieldSet Component around passed in block. Also adds Fieldset-children inner wrapper around block
      #
      # @param legend [String] outputs into a Fieldset-legend component within the Fieldset if set
      # @param hint [String] outputs into a Hint component within the Fieldset if set
      # @return [String] HTML containing the passed in block wrapped by a Fieldset Component and sub components
      def fieldset(legend: nil, hint: nil)
        content_tag :fieldset, class: 'Fieldset' do
          concat(content_tag(:legend, legend, class: 'Fieldset-legend')) if legend
          concat(
            content_tag(:div, class: 'Fieldset-children') do
              concat(content_tag(:p, hint, class: 'Hint')) if hint
              concat(yield)
            end
          )
        end
      end
    end
  end
end
