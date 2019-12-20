# frozen_string_literal: true

RSpec.describe Barnardos::RubyDesignSystem::Inputs::StringInput, type: :inputs do
  class StringInput < described_class; end

  let(:name) { Faker::Lorem.sentence }
  let(:model) { DummyModel.new name: name }

  subject { with_input_for model, :name, :string }

  it 'set input for name with design system class' do
    expect(html.css('input.TextInput-input/@value').first.value).to eq(name)
  end
end
