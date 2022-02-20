# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validate required fields' do
    it 'no validates when not pass name' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.build(:customer, name: nil)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:name]).to include(error_message)
    end

    it 'no validates when not pass kind' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.build(:customer, kind: nil)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:kind]).to include(error_message)
    end

    it 'no validates when not pass contact' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.build(:customer, contact: nil)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:contact]).to include(error_message)
    end

    it 'no validates when not pass document' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.build(:customer, document: nil)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:document]).to include(error_message)
    end

    it 'no validates when not pass address' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.build(:customer, address: nil)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:address]).to include(error_message)
    end

    it 'no validates when not pass number' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.build(:customer, number: nil)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:number]).to include(error_message)
    end

    it 'no validates when not pass district' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.build(:customer, district: nil)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:district]).to include(error_message)
    end

    it 'no validates when not pass city' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.build(:customer, city: nil)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:city]).to include(error_message)
    end

    it 'no validates when not pass state' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.build(:customer, state: nil)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:state]).to include(error_message)
    end

    it 'no validates when not pass postal code' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.build(:customer, postal_code: nil)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:postal_code]).to include(error_message)
    end

    it 'no validates when not pass cellphone' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.build(:customer, cellphone: nil)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:cellphone]).to include(error_message)
    end

    it 'no validates when not pass email' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.build(:customer, email: nil)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:email]).to include(error_message)
    end

    it 'no validates when not pass status' do
      error_message = 'Preenchimento de campo obrigatório!'
      customer = FactoryBot.build(:customer, status: nil)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:status]).to include(error_message)
    end
  end
end
