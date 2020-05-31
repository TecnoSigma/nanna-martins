require 'rails_helper'

RSpec.describe OfferChannel, type: :model do
  it 'no validate when newsletter is null' do
    offer_channel = FactoryBot.build(:offer_channel, newsletter: nil)

    expect(offer_channel).to be_invalid
    expect(offer_channel.errors.messages[:newsletter]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when WhatsApp is null' do
    offer_channel = FactoryBot.build(:offer_channel, whatsapp: nil)

    expect(offer_channel).to be_invalid
    expect(offer_channel.errors.messages[:whatsapp]).to include('Preenchimento de campo obrigatório!')
  end

  it 'no validate when SMS is null' do
    offer_channel = FactoryBot.build(:offer_channel, sms: nil)

    expect(offer_channel).to be_invalid
    expect(offer_channel.errors.messages[:sms]).to include('Preenchimento de campo obrigatório!')
  end

  describe 'validate relationships' do
    it 'with and Customer (1:1)' do
      offer_channel = FactoryBot.build(:offer_channel)

      expect(offer_channel).to respond_to(:customer)
    end
  end
end
