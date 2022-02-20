# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Provider, type: :model do
  describe 'validate required fields' do
    it 'no validates when not pass name' do
      error_message = 'Preenchimento de campo obrigatório!'
      provider = FactoryBot.build(:provider, name: nil)

      expect(provider).to be_invalid
      expect(provider.errors.messages[:name]).to include(error_message)
    end

    it 'no validates when not pass kind' do
      error_message = 'Preenchimento de campo obrigatório!'
      provider = FactoryBot.build(:provider, kind: nil)

      expect(provider).to be_invalid
      expect(provider.errors.messages[:kind]).to include(error_message)
    end

    it 'no validates when not pass document' do
      error_message = 'Preenchimento de campo obrigatório!'
      provider = FactoryBot.build(:provider, document: nil)

      expect(provider).to be_invalid
      expect(provider.errors.messages[:document]).to include(error_message)
    end

    it 'no validates when not pass telphone' do
      error_message = 'Preenchimento de campo obrigatório!'
      provider = FactoryBot.build(:provider, telephone: nil)

      expect(provider).to be_invalid
      expect(provider.errors.messages[:telephone]).to include(error_message)
    end

    it 'no validates when not pass status' do
      error_message = 'Preenchimento de campo obrigatório!'
      provider = FactoryBot.build(:provider, status: nil)

      expect(provider).to be_invalid
      expect(provider.errors.messages[:status]).to include(error_message)
    end
  end

  describe 'validates REGEX' do
    it 'no validates when pass CPF with invalid REGEX' do
      error_message = 'Formato inválido!'
      invalid_cpf = '123456'
      provider = FactoryBot.build(:provider, document: invalid_cpf)

      expect(provider).to be_invalid
      expect(provider.errors.messages[:document]).to include(error_message)
    end

    it 'no validates when pass email with invalid REGEX' do
      error_message = 'Formato inválido!'
      invalid_email = '123456'
      provider = FactoryBot.build(:provider, email: invalid_email)

      expect(provider).to be_invalid
      expect(provider.errors.messages[:email]).to include(error_message)
    end

    it 'no validates when pass telephone with invalid REGEX' do
      error_message     = 'Formato inválido!'
      invalid_telephone = '123456'
      provider = FactoryBot.build(:provider, telephone: invalid_telephone)

      expect(provider).to be_invalid
      expect(provider.errors.messages[:telephone]).to include(error_message)
    end

    it 'no validates when pass postal code with invalid REGEX' do
      error_message = 'Formato inválido!'
      invalid_postal_code = '123456'
      provider = FactoryBot.build(:provider, postal_code: invalid_postal_code)

      expect(provider).to be_invalid
      expect(provider.errors.messages[:postal_code]).to include(error_message)
    end
  end

  describe 'validates relationships' do
    it 'validates relationship N:N between Providers and Feedstocks' do
      provider = Provider.new

      expect(provider).to respond_to(:feedstocks)
    end
  end
end
