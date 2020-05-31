require 'rails_helper'

RSpec.describe Accessory, type: :model do
  it 'no validate when reference is null' do
    accessory = FactoryBot.build(:accessory, reference: nil)

    expect(accessory).to be_invalid
    expect(accessory.errors.messages[:reference]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when reference is duplicated' do
    accessory_1 = FactoryBot.create(:accessory)
    accessory_2 = FactoryBot.build(:accessory, reference: accessory_1.reference)

    expect(accessory_2).to be_invalid
    expect(accessory_2.errors.messages[:reference]).to include('Registro existente!')
  end

  it 'no validate when kind is null' do
    accessory = FactoryBot.build(:accessory, kind: nil)

    expect(accessory).to be_invalid
    expect(accessory.errors.messages[:kind]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when name is null' do
    accessory = FactoryBot.build(:accessory, name: nil)

    expect(accessory).to be_invalid
    expect(accessory.errors.messages[:name]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when feature is null' do
    accessory = FactoryBot.build(:accessory, feature: nil)

    expect(accessory).to be_invalid
    expect(accessory.errors.messages[:feature]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when history is null' do
    accessory = FactoryBot.build(:accessory, history: nil)

    expect(accessory).to be_invalid
    expect(accessory.errors.messages[:history]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when description is null' do
    accessory = FactoryBot.build(:accessory, description: [])

    expect(accessory).to be_invalid
    expect(accessory.errors.messages[:description]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when status is null' do
    accessory = FactoryBot.build(:accessory, status: nil)

    expect(accessory).to be_invalid
    expect(accessory.errors.messages[:status]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when size is null' do
    accessory = FactoryBot.build(:accessory, size: nil)

    expect(accessory).to be_invalid
    expect(accessory.errors.messages[:size]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when complement is null' do
    accessory = FactoryBot.build(:accessory, complement: [])

    expect(accessory).to be_invalid
    expect(accessory.errors.messages[:complement]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when amount is null' do
    accessory = FactoryBot.build(:accessory, amount: nil)

    expect(accessory).to be_invalid
    expect(accessory.errors.messages[:amount]).to include('Preenchimento de campo obrigatório!')
  end


  it 'no validate when amount isn\'t integer' do
    accessory = FactoryBot.build(:accessory, amount: 'any_string')

    expect(accessory).to be_invalid
    expect(accessory.errors.messages[:amount]).to include('Formato inválido!')
  end

  describe 'validate relationships' do
    it 'with Collection (N:1)' do
      accessory = FactoryBot.build(:accessory)

      expect(accessory).to respond_to(:collection)
    end

    it 'with Gender (N:1)' do
      accessory = FactoryBot.build(:accessory)

      expect(accessory).to respond_to(:gender)
    end

    it 'with Stock (N:1)' do
      accessory = FactoryBot.build(:accessory)

      expect(accessory).to respond_to(:stock)
    end

    it 'with Clothing (N:N)' do
      accessory = FactoryBot.build(:accessory)

      expect(accessory).to respond_to(:clothings)
    end

    it 'with Customer (N:N)' do
      accessory = FactoryBot.build(:accessory)

      expect(accessory).to respond_to(:customers)
    end
  end
end
