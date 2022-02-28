#frozen_string_literal: true

require 'rails_helper'

include ControllerMacros

RSpec.describe AdminPanel::DashboardController, type: :request do
  describe 'GET actions' do
    describe '#index' do
      it 'renders home page' do
        login_user

        get '/administrador'

        expect(response).to render_template(:index)
      end
    end
  end
end
