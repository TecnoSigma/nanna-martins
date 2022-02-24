require 'rails_helper'

RSpec.describe Pin, type: :model do
  describe 'validate required fields' do
    it 'no validates when not pass url' do
      error_message = 'Preenchimento de campo obrigatório!'
      pin = FactoryBot.build(:pin, url: nil)

      expect(pin).to be_invalid
      expect(pin.errors.messages[:url]).to include(error_message)
    end

    it 'no validates when not pass segment' do
      error_message = 'Preenchimento de campo obrigatório!'
      pin = FactoryBot.build(:pin, segment: nil)

      expect(pin).to be_invalid
      expect(pin.errors.messages[:segment]).to include(error_message)
    end
  end

  it 'validates inheritance of Pin and Inspiration' do
    expect(described_class).to be < Inspiration
  end
end
