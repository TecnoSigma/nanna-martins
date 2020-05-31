require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'no validate when forename is null' do
    customer = FactoryBot.build(:customer, forename: nil)

    expect(customer).to be_invalid
    expect(customer.errors.messages[:forename]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when surname is null' do
    customer = FactoryBot.build(:customer, surname: nil)

    expect(customer).to be_invalid
    expect(customer.errors.messages[:surname]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when email is null' do
    customer = FactoryBot.build(:customer, email: nil)

    expect(customer).to be_invalid
    expect(customer.errors.messages[:email]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when gender is null' do
    customer = FactoryBot.build(:customer, gender: nil)

    expect(customer).to be_invalid
    expect(customer.errors.messages[:gender]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when document is null' do
    customer = FactoryBot.build(:customer, document: nil)

    expect(customer).to be_invalid
    expect(customer.errors.messages[:document]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when address is null' do
    customer = FactoryBot.build(:customer, address: nil)

    expect(customer).to be_invalid
    expect(customer.errors.messages[:address]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when number is null' do
    customer = FactoryBot.build(:customer, number: nil)

    expect(customer).to be_invalid
    expect(customer.errors.messages[:number]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when district is null' do
    customer = FactoryBot.build(:customer, district: nil)

    expect(customer).to be_invalid
    expect(customer.errors.messages[:district]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when city is null' do
    customer = FactoryBot.build(:customer, city: nil)

    expect(customer).to be_invalid
    expect(customer.errors.messages[:city]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when state is null' do
    customer = FactoryBot.build(:customer, state: nil)

    expect(customer).to be_invalid
    expect(customer.errors.messages[:state]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when postal_code is null' do
    customer = FactoryBot.build(:customer, postal_code: nil)

    expect(customer).to be_invalid
    expect(customer.errors.messages[:postal_code]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when status is null' do
    customer = FactoryBot.build(:customer, status: nil)

    expect(customer).to be_invalid
    expect(customer.errors.messages[:status]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when password is null' do
    customer = FactoryBot.build(:customer, password: nil)

    expect(customer).to be_invalid
    expect(customer.errors.messages[:password]).to include('Preenchimento de campo obrigatório!')
  end

  describe 'validate relationships' do
    it 'with and OfferChannel (1:1)' do
      customer = FactoryBot.build(:customer)

      expect(customer).to respond_to(:offer_channel)
    end

    it 'with and Accessory (N:N)' do                                                                                                                                                   
      customer = FactoryBot.build(:customer)

      expect(customer).to respond_to(:accessories)
    end

    it 'with and Clothing (N:N)' do
      customer = FactoryBot.build(:customer)

      expect(customer).to respond_to(:clothings)
    end
  end
end
