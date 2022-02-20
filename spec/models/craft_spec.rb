require 'rails_helper'

RSpec.describe Craft, type: :model do
  describe 'validate required fields' do
    it 'no validates when not pass name' do
      error_message = 'Preenchimento de campo obrigatório!'
      craft = FactoryBot.build(:craft, code: nil)

      expect(craft).to be_invalid
      expect(craft.errors.messages[:code]).to include(error_message)
    end
  end
end
