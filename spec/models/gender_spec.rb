require 'rails_helper'

RSpec.describe Gender, type: :model do
  it 'no validate when kind is null' do
    gender = FactoryBot.build(:gender, kind: nil)

    expect(gender).to be_invalid
    expect(gender.errors.messages[:kind]).to include('Preenchimento de campo obrigatório!')
  end

  describe 'validate relationships' do
    it 'with and Accessory (1:N)' do
      gender = FactoryBot.build(:gender)

      expect(gender).to respond_to(:accessories)
    end

    it 'with and Clothing (1:N)' do
      gender = FactoryBot.build(:gender)

      expect(gender).to respond_to(:clothings)
    end
  end
end
