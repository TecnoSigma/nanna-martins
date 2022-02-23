require 'rails_helper'

RSpec.describe Cost, type: :model do
  describe 'validates presences' do
    it 'no validates when not pass quantity' do
      error_message = 'Preenchimento de campo obrigatório!'
      cost = FactoryBot.build(:cost, quantity: nil)

      expect(cost).to be_invalid
      expect(cost.errors.messages[:quantity]).to include(error_message)
    end

    it 'no validates when not pass description' do
      error_message = 'Preenchimento de campo obrigatório!'
      cost = FactoryBot.build(:cost, description: nil)

      expect(cost).to be_invalid
      expect(cost.errors.messages[:description]).to include(error_message)
    end

    it 'no validates when not pass periodicity' do
      error_message = 'Preenchimento de campo obrigatório!'
      cost = FactoryBot.build(:cost, periodicity: nil)

      expect(cost).to be_invalid
      expect(cost.errors.messages[:periodicity]).to include(error_message)
    end

    it 'no validates when not pass price' do
      error_message = 'Preenchimento de campo obrigatório!'
      cost = FactoryBot.build(:cost, price: nil)

      expect(cost).to be_invalid
      expect(cost.errors.messages[:price]).to include(error_message)
    end
  end

  describe 'validates relationships' do
    it 'validates relationship N:1 between Costs and Crafts' do
      cost = Cost.new

      expect(cost).to respond_to(:craft)
    end
  end
end
