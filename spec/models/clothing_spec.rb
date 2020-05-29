require 'rails_helper'

RSpec.describe Clothing, type: :model do
  it 'no validate when reference is null' do
    clothing = FactoryBot.build(:clothing, reference: nil)

    expect(clothing).to be_invalid
    expect(clothing.errors.messages[:reference]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when reference is duplicated' do
    clothing_1 = FactoryBot.create(:clothing)
    clothing_2 = FactoryBot.build(:clothing, reference: clothing_1.reference)

    expect(clothing_2).to be_invalid
    expect(clothing_2.errors.messages[:reference]).to include('Registro existente!')
  end

  it 'no validate when kind is null' do
    clothing = FactoryBot.build(:clothing, kind: nil)

    expect(clothing).to be_invalid
    expect(clothing.errors.messages[:kind]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when name is null' do
    clothing = FactoryBot.build(:clothing, name: nil)

    expect(clothing).to be_invalid
    expect(clothing.errors.messages[:name]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when feature is null' do
    clothing = FactoryBot.build(:clothing, feature: nil)

    expect(clothing).to be_invalid
    expect(clothing.errors.messages[:feature]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when history is null' do
    clothing = FactoryBot.build(:clothing, history: nil)

    expect(clothing).to be_invalid
    expect(clothing.errors.messages[:history]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when description is null' do
    clothing = FactoryBot.build(:clothing, description: [])

    expect(clothing).to be_invalid
    expect(clothing.errors.messages[:description]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when status is null' do
    clothing = FactoryBot.build(:clothing, status: nil)

    expect(clothing).to be_invalid
    expect(clothing.errors.messages[:status]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when size is null' do
    clothing = FactoryBot.build(:clothing, size: nil)

    expect(clothing).to be_invalid
    expect(clothing.errors.messages[:size]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when complement is null' do
    clothing = FactoryBot.build(:clothing, complement: [])

    expect(clothing).to be_invalid
    expect(clothing.errors.messages[:complement]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when amount is null' do
    clothing = FactoryBot.build(:clothing, amount: nil)

    expect(clothing).to be_invalid
    expect(clothing.errors.messages[:amount]).to include('Preenchimento de campo obrigatório!')
  end


  it 'no validate when amount isn\'t integer' do
    clothing = FactoryBot.build(:clothing, amount: 'any_string')

    expect(clothing).to be_invalid
    expect(clothing.errors.messages[:amount]).to include('Formato inválido!')
  end
end
