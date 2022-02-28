# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validate required fields' do
    it 'no validates when not pass email' do
      error_message = 'Preenchimento de campo obrigatório!'
      user = FactoryBot.build(:user, email: nil)

      expect(user).to be_invalid
      expect(user.errors.messages[:email]).to include(error_message)
    end

    it 'no validates when not pass password' do
      error_message = 'Preenchimento de campo obrigatório!'
      user = FactoryBot.build(:user, password: nil)

      expect(user).to be_invalid
      expect(user.errors.messages[:password]).to include(error_message)
    end
  end
end
