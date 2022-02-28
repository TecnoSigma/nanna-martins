#frozen_string_literal: true

require 'rails_helper'

RSpec.describe Devise::SessionsController, type: :request do
  describe 'GET actions' do
    describe '#sign_in' do
      it 'renders home page' do
        get '/administrador/login'

        expect(response).to render_template('devise/sessions/new')
      end
    end
  end

  describe 'DELETE actions' do
    describe '#sign_out' do
      it 'renders home page' do
        delete '/logout'

        expect(response).to redirect_to('/administrador/login')
      end
    end
  end
end
