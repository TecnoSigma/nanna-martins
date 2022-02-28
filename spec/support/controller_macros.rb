# frozen_string_literal: true

module ControllerMacros
  def login_user
    sign_in(FactoryBot.create(:user))
  end
end
