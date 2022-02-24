require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validate required fields' do
    it 'no validates when not pass delivery forecast' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.create(:customer)
      order = FactoryBot.build(:order, customer: customer, delivery_forecast: nil)

      expect(order).to be_invalid
      expect(order.errors.messages[:delivery_forecast]).to include(error_message)
    end

    it 'no validates when not pass freight' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.create(:customer)
      order = FactoryBot.build(:order, customer: customer, freight: nil)

      expect(order).to be_invalid
      expect(order.errors.messages[:freight]).to include(error_message)
    end

    it 'no validates when not pass final payment' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.create(:customer)
      order = FactoryBot.build(:order, customer: customer, final_payment: nil)

      expect(order).to be_invalid
      expect(order.errors.messages[:final_payment]).to include(error_message)
    end

    it 'no validates when not pass down payment' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.create(:customer)
      order = FactoryBot.build(:order, customer: customer, down_payment: nil)

      expect(order).to be_invalid
      expect(order.errors.messages[:down_payment]).to include(error_message)
    end

    it 'no validates when not pass quantity' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.create(:customer)
      order = FactoryBot.build(:order, customer: customer, quantity: nil)

      expect(order).to be_invalid
      expect(order.errors.messages[:quantity]).to include(error_message)
    end
  end

  describe 'validates relationships' do
    it 'validates relatioships 1:N between Order and Crafts' do
      order = Order.new

      expect(order).to respond_to(:crafts)
    end

    it 'validates relatioships N:1 between Order and Customer' do
      order = Order.new

      expect(order).to respond_to(:customer)
    end
  end
end
