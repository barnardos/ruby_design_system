# frozen_string_literal: true

RSpec.describe Barnardos::RubyDesignSystem::Inputs::CollectionCheckBoxesInput, type: :inputs do
  class CollectionCheckBoxesInput < described_class; end

  let(:name) { Faker::Lorem.sentence }
  let(:model) { DummyModel.new name: name }
  let(:names) { (0..3).map { Faker::Name.name } }

  subject { with_input_for model, :name, :check_boxes, collection: names }

  it 'sets check boxes for each name with design system class' do
    expect(html.css('input[type=checkbox].Switch-input').length).to eq(names.length)
  end

  it 'sets the label class' do
    expect(html.css('label.Switch-label').length).to eq(names.length)
  end

  it 'wraps each input with the correct classes' do
    expect(html.css('div.Switch').length).to eq(names.length)
    expect(html.css('div.Switch input[type=checkbox].Switch-input').length).to eq(names.length)
    expect(html.css('div.Switches-item').length).to eq(names.length)
    expect(html.css('div.Switches-item input[type=checkbox].Switch-input').length).to eq(names.length)
    expect(html.css('div.Switch--checkbox').length).to eq(names.length)
    expect(html.css('div.Switch--checkbox input[type=checkbox].Switch-input').length).to eq(names.length)
  end

  it 'wraps all the inputs in an outer div' do
    expect(html.css('div.Switches-items').length).to eq(1)
    expect(html.css('div.Switches-items input[type=checkbox].Switch-input').length).to eq(names.length)
  end
end
