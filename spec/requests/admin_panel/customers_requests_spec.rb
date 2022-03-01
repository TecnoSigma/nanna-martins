#frozen_string_literal: true

require 'rails_helper'

include ControllerMacros

RSpec.describe AdminPanel::CustomersController, type: :request do
  describe 'GET actions' do
    describe '#index' do
      it 'renders customers page' do
        login_user

        get '/administrador/clientes'

        expect(response).to render_template(:index)
      end
    end
  end
end
