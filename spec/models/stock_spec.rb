# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Stock, type: :model do
  describe 'validate required fields' do
    it 'no validates when not pass reference' do
      error_message = 'Preenchimento de campo obrigatório!'
      stock = FactoryBot.build(:stock, reference: nil)

      expect(stock).to be_invalid
      expect(stock.errors.messages[:reference]).to include(error_message)
    end

    it 'no validates when not pass name' do
      error_message = 'Preenchimento de campo obrigatório!'
      stock = FactoryBot.build(:stock, name: nil)

      expect(stock).to be_invalid
      expect(stock.errors.messages[:name]).to include(error_message)
    end

    it 'no validates when not pass measurement unit' do
      error_message = 'Preenchimento de campo obrigatório!'
      stock = FactoryBot.build(:stock, measurement_unit: nil)

      expect(stock).to be_invalid
      expect(stock.errors.messages[:measurement_unit]).to include(error_message)
    end

    it 'no validates when not pass price' do
      error_message = 'Preenchimento de campo obrigatório!'
      stock = FactoryBot.build(:stock, price: nil)

      expect(stock).to be_invalid
      expect(stock.errors.messages[:price]).to include(error_message)
    end

    it 'no validates when not pass quantity' do
      error_message = 'Preenchimento de campo obrigatório!'
      stock = FactoryBot.build(:stock, quantity: nil)

      expect(stock).to be_invalid
      expect(stock.errors.messages[:quantity]).to include(error_message)
    end
  end

  describe 'validates relationships' do
    it 'validates relationship N:N between Stock and Provider' do
      stock = Stock.new

      expect(stock).to respond_to(:providers)
    end

    it 'validates relationship 1:N between Stock and Feedstock' do
      stock = Stock.new

      expect(stock).to respond_to(:feedstocks)
    end
  end

  describe 'validates scopes' do
    it 'ordered by name' do
      stock1 = FactoryBot.create(:stock, name: 'XPTO S.A.')
      stock2 = FactoryBot.create(:stock, name: 'ABC S.A.')

      result = Stock.ordered_by_name

      expected_result = [stock2, stock1]

      expect(result).to eq(expected_result)
    end
  end

  describe '#total_price' do
    it 'returns total price' do
      price = 10.0
      quantity = 15
      total_price = 150.0

      stock = FactoryBot.create(:stock, price: price, quantity: quantity)

      result = stock.total_price

      expect(result).to eq(total_price)
    end
  end
end
