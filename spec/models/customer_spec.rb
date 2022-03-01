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

  describe 'validates REGEX' do
    it 'no validates when pass CPF with invalid REGEX' do
      error_message = 'Formato inválido!'
      invalid_cpf = '123456'
      customer = FactoryBot.build(:customer, document: invalid_cpf)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:document]).to include(error_message)
    end

    it 'no validates when pass email with invalid REGEX' do
      error_message = 'Formato inválido!'
      invalid_email = '123456'
      customer = FactoryBot.build(:customer, email: invalid_email)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:email]).to include(error_message)
    end

    it 'no validates when pass cellphone with invalid REGEX' do
      error_message     = 'Formato inválido!'
      invalid_cellphone = '123456'
      customer = FactoryBot.build(:customer, cellphone: invalid_cellphone)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:cellphone]).to include(error_message)
    end

    it 'no validates when pass postal code with invalid REGEX' do
      error_message = 'Formato inválido!'
      invalid_postal_code = '123456'
      customer = FactoryBot.build(:customer, postal_code: invalid_postal_code)

      expect(customer).to be_invalid
      expect(customer.errors.messages[:postal_code]).to include(error_message)
    end
  end

  describe 'validates relationships' do
    it 'validates relatioships 1:N between Customer and Orders' do
      customer = Customer.new

      expect(customer).to respond_to(:orders)
    end
  end

  describe '#full_address' do
    it 'returns customer full address' do
      customer = FactoryBot.create(:customer)

      result = customer.full_address

      expected_result = "#{customer.address}, #{customer.number} - #{customer.complement} - " \
                        "#{customer.district} - #{customer.city} - #{customer.state} - " \
                        "#{customer.postal_code}"

      expect(result).to eq(expected_result)
    end
  end

  describe 'validates scopes' do
    it 'ordered by name' do
      customer1 = FactoryBot.create(:customer, name: 'XPTO S.A.')
      customer2 = FactoryBot.create(:customer, name: 'ABC S.A.')

      result = Customer.ordered_by_name

      expected_result = [customer2, customer1]

      expect(result).to eq(expected_result)
    end
  end

  describe '#pendent?' do
    it 'returns \'true\' when customer status is pendent' do
      customer = FactoryBot.create(:customer, status: 'pendent')

      result = customer.pendent?

      expect(result).to eq(true)
    end

    it 'returns \'false\' when customer status is activated' do
      customer = FactoryBot.create(:customer, status: 'activated')

      result = customer.pendent?

      expect(result).to eq(false)
    end

    it 'returns \'true\' when customer status is deactivated' do
      customer = FactoryBot.create(:customer, status: 'deactivated')

      result = customer.pendent?

      expect(result).to eq(false)
    end
  end

  describe '#activated?' do
    it 'returns \'false\' when customer status is pendent' do
      customer = FactoryBot.create(:customer, status: 'pendent')

      result = customer.activated?

      expect(result).to eq(false)
    end

    it 'returns \'true\' when customer status is activated' do
      customer = FactoryBot.create(:customer, status: 'activated')

      result = customer.activated?

      expect(result).to eq(true)
    end

    it 'returns \'false\' when customer status is deactivated' do
      customer = FactoryBot.create(:customer, status: 'deactivated')

      result = customer.activated?

      expect(result).to eq(false)
    end
  end
end
