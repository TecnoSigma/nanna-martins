#frozen_string_literal: true

require 'rails_helper'

include ControllerMacros

RSpec.describe AdminPanel::InspirationsController, type: :request do
  before(:each) { login_user }

  describe 'GET actions' do
    describe '#index' do
      it 'renders stocks page' do
        get '/administrador/inspiracoes'

        expect(response).to render_template(:index)
      end
    end

    describe '#pinterest' do
      it 'renders pinterest page' do
        get '/administrador/inspiracoes/pinterest'

        expect(response).to render_template(:pinterest)
      end
    end
  end
end
