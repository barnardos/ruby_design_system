module Barnardos
  module RubyDesignSystem
    module ComponentHelper
      def prominent_link(name = nil, options = nil, html_options = {}, &block)
        colour = html_options.delete(:colour)
        colour_class = colour && "ProminentLink--#{colour}"
        html_options[:class] = [html_options[:class], 'ProminentLink', colour_class].flatten.compact
        link_to(name, options, html_options, &block)
      end

      def skip_link(text, anchor: '#main-anchor')
        link_to text, anchor, class: 'SkipLink'
      end

      def link(name = nil, options = nil, html_options = {}, &block)
        html_options[:class] = [html_options[:class], 'Link'].flatten.compact
        link_to(name, options, html_options, &block)
      end

      def link_to(name = nil, options = nil, html_options = {}, &block)
        html_options[:target] = '_blank' if html_options.delete(:new_window)
        super
      end

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
