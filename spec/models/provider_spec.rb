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

  describe '#full_address' do
    it 'returns provider full address' do
      provider = FactoryBot.create(:provider)

      result = provider.full_address

      expected_result = "#{provider.address}, #{provider.number} - #{provider.complement} - " \
                        "#{provider.district} - #{provider.city} - #{provider.state} - " \
                        "#{provider.postal_code}"

      expect(result).to eq(expected_result)
    end
  end

  describe 'validates scopes' do
    it 'ordered by name' do
      provider1 = FactoryBot.create(:provider, name: 'XPTO S.A.')
      provider2 = FactoryBot.create(:provider, name: 'ABC S.A.')

      result = Provider.ordered_by_name

      expected_result = [provider2, provider1]

      expect(result).to eq(expected_result)
    end
  end

  describe '#pendent?' do
    it 'returns \'true\' when provider status is pendent' do
      provider = FactoryBot.create(:provider, status: 'pendent')

      result = provider.pendent?

      expect(result).to eq(true)
    end

    it 'returns \'false\' when provider status is activated' do
      provider = FactoryBot.create(:provider, status: 'activated')

      result = provider.pendent?

      expect(result).to eq(false)
    end

    it 'returns \'true\' when provider status is deactivated' do
      provider = FactoryBot.create(:provider, status: 'deactivated')

      result = provider.pendent?

      expect(result).to eq(false)
    end
  end

  describe '#activated?' do
    it 'returns \'false\' when provider status is pendent' do
      provider = FactoryBot.create(:provider, status: 'pendent')

      result = provider.activated?

      expect(result).to eq(false)
    end

    it 'returns \'true\' when provider status is activated' do
      provider = FactoryBot.create(:provider, status: 'activated')

      result = provider.activated?

      expect(result).to eq(true)
    end

    it 'returns \'false\' when provider status is deactivated' do
      provider = FactoryBot.create(:provider, status: 'deactivated')

      result = provider.activated?

      expect(result).to eq(false)
    end
  end
end
