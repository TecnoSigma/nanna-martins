# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Feedstock, type: :model do
  describe 'validate required fields' do
    it 'no validates when not pass measurement unit' do
      error_message = 'Preenchimento de campo obrigatório!'
      feedstock = FactoryBot.build(:feedstock, measurement_unit: nil)

      expect(feedstock).to be_invalid
      expect(feedstock.errors.messages[:measurement_unit]).to include(error_message)
    end

    it 'no validates when not pass name' do
      error_message = 'Preenchimento de campo obrigatório!'
      feedstock = FactoryBot.build(:feedstock, name: nil)

      expect(feedstock).to be_invalid
      expect(feedstock.errors.messages[:name]).to include(error_message)
    end

    it 'no validates when not pass quantity' do
      error_message = 'Preenchimento de campo obrigatório!'
     feedstock = FactoryBot.build(:feedstock, quantity: nil)

      expect(feedstock).to be_invalid
      expect(feedstock.errors.messages[:quantity]).to include(error_message)
    end

    it 'no validates when not pass description' do
      error_message = 'Preenchimento de campo obrigatório!'
      feedstock = FactoryBot.build(:feedstock, description: nil)

      expect(feedstock).to be_invalid
      expect(feedstock.errors.messages[:description]).to include(error_message)
    end
  end

  describe 'validates relationships' do
    it 'validates relationship N:N between Feedstocks and Providers' do
      feedstock = Feedstock.new

      expect(feedstock).to respond_to(:providers)
    end

    it 'validates relationship N:N between Crafts and Feedstocks' do
      craft = Craft.new

      expect(craft).to respond_to(:feedstocks)
    end
  end
end
