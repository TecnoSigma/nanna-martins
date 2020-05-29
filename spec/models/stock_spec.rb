require 'rails_helper'

RSpec.describe Stock, type: :model do
  it 'no validate when minimum is null' do
    stock = FactoryBot.build(:stock, minimum: nil)

    expect(stock).to be_invalid
    expect(stock.errors.messages[:minimum]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when maximum is null' do
    stock = FactoryBot.build(:stock, maximum: nil)

    expect(stock).to be_invalid
    expect(stock.errors.messages[:maximum]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when minimum isn\'t integer' do
    stock = FactoryBot.build(:stock, minimum: 'any_string')

    expect(stock).to be_invalid
    expect(stock.errors.messages[:minimum]).to include('Formato inválido!')
  end

  it 'no validate when maximum isn\'t integer' do
    stock = FactoryBot.build(:stock, maximum: 'any_string')

    expect(stock).to be_invalid
    expect(stock.errors.messages[:maximum]).to include('Formato inválido!')
  end

  it 'no validate when maximum value is less than minimum stock' do
    stock = FactoryBot.build(:stock, minimum: 100, maximum: 10)

    expect(stock).to be_invalid
    expect(stock.errors.messages[:maximum]).to include('Valor máximo não pode ser maior que o valor mínimo!')
  end
end
