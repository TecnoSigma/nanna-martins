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

    describe '#list' do
      context 'when pass allowed inspirations kind' do
        Inspiration::ALLOWED_KINDS.each do |kind|
          it "renders inspirations page (#{kind})" do
            get "/administrador/inspiracoes/#{kind}/listar"

            expect(response).to render_template(:list)
          end
        end
      end

      context 'when no pass allowed inspirations kind' do
        it 'shows error message' do
          get "/administrador/inspiracoes/not_allowed_kind/listar"

          expect(flash[:alert]).to eq('Tipo de inspiração não permitido!')
        end

        it 'redirects to page of inspirations choose' do
          get "/administrador/inspiracoes/not_allowed_kind/listar"

          expect(response).to redirect_to(admin_panel_inspiracoes_path)
        end
      end
    end
  end
end
