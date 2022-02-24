require 'rails_helper'

RSpec.describe Craft, type: :model do
  describe 'validate required fields' do
    it 'no validates when not pass description' do
      error_message = 'Preenchimento de campo obrigatório!'
      craft = FactoryBot.build(:craft, description: nil)

      expect(craft).to be_invalid
      expect(craft.errors.messages[:description]).to include(error_message)
    end

    it 'no validates when not pass quantity' do
      error_message = 'Preenchimento de campo obrigatório!'
      craft = FactoryBot.build(:craft, quantity: nil)

      expect(craft).to be_invalid
      expect(craft.errors.messages[:quantity]).to include(error_message)
    end

    it 'no validates when quantity more than one when is exclusive' do
      error_message = 'Quantidade inválida!'
      craft = FactoryBot.build(:craft, quantity: 10, exclusivity: true)

      expect(craft).to be_invalid
      expect(craft.errors.messages[:quantity]).to include(error_message)
    end

    it 'no validates when not pass season' do
      error_message = 'Preenchimento de campo obrigatório!'
      craft = FactoryBot.build(:craft, season: nil)

      expect(craft).to be_invalid
      expect(craft.errors.messages[:season]).to include(error_message)
    end

    it 'no validates when not pass year' do
      error_message = 'Preenchimento de campo obrigatório!'
      craft = FactoryBot.build(:craft, year: nil)

      expect(craft).to be_invalid
      expect(craft.errors.messages[:year]).to include(error_message)
    end

    it 'no validates when not pass exclusivity' do
      error_message = 'Preenchimento de campo obrigatório!'
      craft = FactoryBot.build(:craft, exclusivity: nil)

      expect(craft).to be_invalid
      expect(craft.errors.messages[:exclusivity]).to include(error_message)
    end
  end

  it 'generates craft reference when a new craft is created' do
    craft = FactoryBot.build(:craft, reference: nil)

    craft.save

    result = craft.reference

    expect(result).to be_present
  end

  describe 'validates relationships' do
    it 'validates relationship N:N between Feedstocks and Crafts' do
      craft = Craft.new

      expect(craft).to respond_to(:feedstocks)
    end

    it 'validates relationship 1:N between Crafts and Costs' do
      craft = Craft.new

      expect(craft).to respond_to(:costs)
    end

    it 'validates relationship N:1 between Crafts and Order' do
      craft = Craft.new

      expect(craft).to respond_to(:order)
    end
  end
end
