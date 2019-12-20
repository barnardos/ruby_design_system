# frozen_string_literal: true

RSpec.describe Barnardos::RubyDesignSystem::Inputs::CollectionSelectInput, type: :inputs do
  class CollectionSelectInput < described_class; end

  let(:name) { Faker::Lorem.sentence }
  let(:model) { DummyModel.new name: name }
  let(:names) { (0..3).map { Faker::Name.name } }

  subject { with_input_for model, :name, :select, collection: names }

  it 'set select for names with design system class' do
    prompt_option_line_length = 1
    expect(html.css('select.Select option').length).to eq(names.length + prompt_option_line_length)
  end
end
