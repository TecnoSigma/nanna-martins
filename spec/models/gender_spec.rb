require 'rails_helper'

RSpec.describe Gender, type: :model do
  it 'no validate when kind is null' do
    gender = FactoryBot.build(:gender, kind: nil)

    expect(gender).to be_invalid
    expect(gender.errors.messages[:kind]).to include('Preenchimento de campo obrigatório!')
  end
end
