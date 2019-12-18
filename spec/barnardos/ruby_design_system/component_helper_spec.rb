# frozen_string_literal: true

RSpec.describe Barnardos::RubyDesignSystem::ComponentHelper, type: :helper do
  require 'action_controller'
  require 'action_view'
  require 'nokogiri'
  require 'faker'
  ActionView::Helpers.include described_class
  include ActionView::Helpers::UrlHelper

  let(:helper) do
    ActionController::Base.helpers
  end
  let(:name) { Faker::Lorem.sentence }
  let(:url) { Faker::Internet.url(host: 'example.com') }

  describe '#prominent_link' do
    let(:colour) { nil }
    subject { helper.prominent_link(name, url, colour: colour) }
    it 'creates a link with class "ProminentLink"' do
      expect(subject).to eq(link_to(name, url, class: 'ProminentLink'))
    end

    context 'with colour pink' do
      let(:colour) { :pink }
      it 'add a colour specific class to the link' do
        expect(subject).to eq(link_to(name, url, class: 'ProminentLink ProminentLink--pink'))
      end
    end
  end

  describe '#skip_link' do
    let(:anchor) { '#foo-bar' }

    it 'creates a link to "#main-anchor" with class "SkipLink"' do
      expect(helper.skip_link(name)).to eq(link_to(name, '#main-anchor', class: 'SkipLink'))
    end

    it 'allow alternative anchor to be passed in' do
      expect(helper.skip_link(name, anchor: anchor)).to eq(link_to(name, anchor, class: 'SkipLink'))
    end
  end

  describe '#link' do
    it 'creates a link with class "Link"' do
      expect(helper.link(name, url)).to eq(link_to(name, url, class: 'Link'))
    end

    it 'allows additional classes to be added' do
      klass = 'Foo'
      expect(helper.link(name, url, class: klass)).to eq(link_to(name, url, class: "#{klass} Link"))
    end
  end

  describe '#link_to' do
    let(:options) { {} }
    subject { helper.link_to(name, url, options) }
    it 'behaves as normal' do
      expect(subject).to eq(link_to(name, url))
    end

    context 'with new window option' do
      let(:options) { { new_window: true } }
      it 'adds content to link to' do
        expect(subject).not_to eq(link_to(name, url))
      end

      it 'sets target as blank' do
        expect(subject).to include('target="_blank"')
      end
    end
  end

  describe '#fieldset' do
    let(:options) { {} }
    let(:content) { name }

    subject do
      helper.fieldset(options) { name }
    end

    let(:html) { Nokogiri::HTML(subject) }
    let(:legend_html) { html.css('legend.Fieldset-legend') }
    let(:hint_html) { html.css('p.Hint') }

    it 'wraps content in inner div' do
      expect(html.css('div.Fieldset-children').text).to eq(name)
    end

    it 'wraps content in outer fieldset' do
      expect(html.css('fieldset.Fieldset').children).to eq(html.css('div.Fieldset-children'))
    end

    it 'does not include legend' do
      expect(legend_html).to be_empty
    end

    it 'does not include hint' do
      expect(hint_html).to be_empty
    end

    context 'with legend' do
      let(:legend) { Faker::Lorem.sentence }
      let(:options) { { legend: legend } }

      it 'outputs legend' do
        expect(legend_html.text).to eq(legend)
      end
    end

    context 'with hint' do
      let(:hint) { Faker::Lorem.sentence }
      let(:options) { { hint: hint } }

      it 'outputs hint' do
        expect(hint_html.text).to eq(hint)
      end
    end
  end
end

