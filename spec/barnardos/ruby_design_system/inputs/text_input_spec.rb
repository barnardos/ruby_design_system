# frozen_string_literal: true

RSpec.describe Barnardos::RubyDesignSystem::Inputs::TextInput, type: :inputs do
  class TextInput < described_class; end

  let(:name) { Faker::Lorem.sentence }
  let(:model) { DummyModel.new name: name }

  subject { with_input_for model, :name, :text }

  it 'set textarea for name with design system class' do
    expect(html.css('textarea.TextArea-textarea').text.strip).to eq(name)
  end
end
