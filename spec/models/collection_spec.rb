require 'rails_helper'

RSpec.describe Collection, type: :model do
  it 'no validate when name is null' do
    collection = FactoryBot.build(:collection, name: nil)

    expect(collection).to be_invalid
    expect(collection.errors.messages[:name]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when station is null' do
    collection = FactoryBot.build(:collection, station: nil)

    expect(collection).to be_invalid
    expect(collection.errors.messages[:station]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when status is null' do
    collection = FactoryBot.build(:collection, status: nil)

    expect(collection).to be_invalid
    expect(collection.errors.messages[:status]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when year is null' do
    collection = FactoryBot.build(:collection, year: nil)

    expect(collection).to be_invalid
    expect(collection.errors.messages[:year]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validates when year isn\'t a integer' do
    collection = FactoryBot.build(:collection, year: 'any_string')

    expect(collection).to be_invalid
    expect(collection.errors.messages[:year]).to include('Formato inválido!')
  end
end
