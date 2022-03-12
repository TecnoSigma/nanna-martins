#frozen_string_literal: true

require 'rails_helper'

include ControllerMacros

RSpec.describe AdminPanel::ProvidersController, type: :request do
  before(:each) { login_user }

  describe 'GET actions' do
    describe '#details' do
      it 'renders providers page' do
        provider = FactoryBot.create(:provider)

        get "/administrador/fornecedores/#{provider.id}/detalhes"

        expect(response).to render_template(:details)
      end
    end

    describe '#new' do
      it 'renders new provider page' do
        get '/administrador/fornecedores/novo'

        expect(response).to render_template(:new)
      end
    end

    describe '#edit' do
      context 'when provider is found' do
        it 'renders providers edit page' do
          provider = FactoryBot.create(:provider)

          get "/administrador/fornecedores/#{provider.id}/editar"

          expect(response).to render_template(:edit)
        end
      end

      context 'when provider is not found' do
        it 'redirects to providers page' do
          get "/administrador/fornecedores/incorrect_id/editar"

          expect(response).to redirect_to(admin_panel_fornecedores_path)
        end

        it 'shows error message' do
          get "/administrador/fornecedores/incorrect_id/editar"

          expect(flash[:alert]).to eq('Erro ao procurar dados!')
        end
      end

      context 'when occurs errors' do
        it 'redirects to providers page' do
          provider = FactoryBot.create(:provider)

          allow(Provider).to receive(:find) { raise StandardError }

          get "/administrador/fornecedores/#{provider.id}/editar"

          expect(response).to redirect_to(admin_panel_fornecedores_path)
        end

        it 'shows error message' do
          provider = FactoryBot.create(:provider)

          allow(Provider).to receive(:find) { raise StandardError }

          get "/administrador/fornecedores/#{provider.id}/editar"

          expect(flash[:alert]).to eq('Erro ao procurar dados!')
        end
      end
    end
  end

  describe 'PUT actions' do
    describe '#update' do
      context 'when provider is found' do
        context 'and pass valid params' do
          it 'updates provider data' do
            provider = FactoryBot.create(:provider)

            new_name = 'João da Silva'

            put "/administrador/fornecedores/#{provider.id}/update", params: { provider: { name: new_name } }

            result = Provider.find_by_name(new_name)

            expect(result).to be_present
          end

          it 'redirects to providers page' do
            provider = FactoryBot.create(:provider)

            new_name = 'João da Silva'

            put "/administrador/fornecedores/#{provider.id}/update", params: { provider: { name: new_name } }

            expect(response).to redirect_to(admin_panel_fornecedores_path)
          end

          it 'shows success message' do
            provider = FactoryBot.create(:provider)

            new_name = 'João da Silva'

            put "/administrador/fornecedores/#{provider.id}/update", params: { provider: { name: new_name } }

            expect(flash[:notice]).to eq('Dados atualizados com sucesso!')
          end
        end

        context 'and pass invalid params' do
          it 'updates provider data' do
            provider = FactoryBot.create(:provider)

            new_document = '123456'

            put "/administrador/fornecedores/#{provider.id}/update", params: { provider: { document: new_document } }

            result = Provider.find_by_document(new_document)

            expect(result).to be_nil
          end

          it 'redirects to providers page' do
            provider = FactoryBot.create(:provider)

            new_document = '123456'

            put "/administrador/fornecedores/#{provider.id}/update", params: { provider: { document: new_document } }

            expect(response).to redirect_to(admin_panel_fornecedores_path)
          end

          it 'shows error message' do
            provider = FactoryBot.create(:provider)

            new_document = '123456'

            put "/administrador/fornecedores/#{provider.id}/update", params: { provider: { document: new_document } }

            expect(flash[:alert]).to eq('Erro ao atualizar dados!')
          end
        end
      end

      context 'when provider is not found' do
        it 'redirects to providers page' do
          new_name = 'João da Silva'

          put "/administrador/fornecedores/incorrect_id/update", params: { provider: { name: new_name } }

          expect(response).to redirect_to(admin_panel_fornecedores_path)
        end

        it 'shows error message' do
          new_name = 'João da Silva'

          put "/administrador/fornecedores/incorrect_id/update", params: { provider: { name: new_name } }

          expect(flash[:alert]).to eq('Erro ao atualizar dados!')
        end
      end

      context 'when occurs errors' do
        it 'no updates provider data' do
          provider = FactoryBot.create(:provider)

          new_name = 'João da Silva'

          allow(Provider).to receive(:find) { raise StandardError }

          put "/administrador/fornecedores/#{provider.id}/update", params: { provider: { name: new_name } }

          result = Provider.find_by_name(new_name)

          expect(result).to be_nil
        end

        it 'redirects to providers page' do
          provider = FactoryBot.create(:provider)

          new_name = 'João da Silva'

          allow(Provider).to receive(:find) { raise StandardError }

          put "/administrador/fornecedores/#{provider.id}/update", params: { provider: { name: new_name } }

          expect(response).to redirect_to(admin_panel_fornecedores_path)
        end

        it 'shows error message' do
          provider = FactoryBot.create(:provider)

          new_name = 'João da Silva'

          allow(Provider).to receive(:find) { raise StandardError }

          put "/administrador/fornecedores/#{provider.id}/update", params: { provider: { name: new_name } }

          expect(flash[:alert]).to eq('Erro ao atualizar dados!')
        end
      end
    end

    describe '#status' do
      context 'when status is valid' do
        it 'updates status' do
          login_user

          new_status = 'activated'
          provider = FactoryBot.create(:provider, status: 'deactivated')

          put "/administrador/fornecedores/#{provider.id}/status",
              params: { status: new_status }

          result = Provider.find_by_document(provider.document).status

          expect(result).to eq(new_status)
        end

        it 'shows success message' do
          login_user

          new_status = 'activated'
          provider = FactoryBot.create(:provider, status: 'deactivated')

          put "/administrador/fornecedores/#{provider.id}/status",
              params: { status: new_status }

          expect(flash[:notice]).to eq('Dados atualizados com sucesso!')
        end

        it 'redirects to providers page' do
          login_user

          new_status = 'activated'
          provider = FactoryBot.create(:provider, status: 'deactivated')

          put "/administrador/fornecedores/#{provider.id}/status",
              params: { status: new_status }

          expect(response).to redirect_to(admin_panel_fornecedores_path)
        end
      end

      context 'when status is invalid' do
        it 'no updates status' do
          login_user

          new_status = 'invalid_status'
          provider = FactoryBot.create(:provider, status: 'deactivated')

          put "/administrador/fornecedores/#{provider.id}/status",
              params: { status: new_status }

          result = Provider.find_by_document(provider.document).status

          expect(result).not_to eq(new_status)
        end

        it 'shows error message' do
          login_user

          new_status = 'invalid_status'
          provider = FactoryBot.create(:provider, status: 'deactivated')

          put "/administrador/fornecedores/#{provider.id}/status",
              params: { status: new_status }

          expect(flash[:alert]).to eq('Erro ao atualizar dados!')
        end

        it 'redirects to providers page' do
          login_user

          new_status = 'invalid_status'
          provider = FactoryBot.create(:provider, status: 'deactivated')

          put "/administrador/fornecedores/#{provider.id}/status",
              params: { status: new_status }

          expect(response).to redirect_to(admin_panel_fornecedores_path)
        end
      end

      context 'when provider is not found' do
        it 'shows error message' do
          login_user

          new_status = 'invalid_status'

          put "/administrador/fornecedores/invalid_id/status",
              params: { status: new_status }

          expect(flash[:alert]).to eq('Erro ao atualizar dados!')
        end

        it 'redirects to providers page' do
          login_user

          new_status = 'invalid_status'

          put "/administrador/fornecedores/invalid_id/status",
              params: { status: new_status }

          expect(response).to redirect_to(admin_panel_fornecedores_path)
        end
      end

      context 'when occurs errors' do
        it 'no updates status' do
          login_user

          new_status = 'activated'
          provider = FactoryBot.create(:provider, status: 'deactivated')

          allow(Provider).to receive(:find) { raise StandardError }

          put "/administrador/fornecedores/#{provider.id}/status",
              params: { status: new_status }

          result = Provider.find_by_document(provider.document).status

          expect(result).not_to eq(new_status)
        end

        it 'shows error message' do
          login_user

          new_status = 'activated'
          provider = FactoryBot.create(:provider, status: 'deactivated')

          allow(Provider).to receive(:find) { raise StandardError }

          put "/administrador/fornecedores/#{provider.id}/status",
              params: { status: new_status }

          expect(flash[:alert]).to eq('Erro ao atualizar dados!')
        end

        it 'redirects to providers page' do
          login_user

          new_status = 'activated'
          provider = FactoryBot.create(:provider, status: 'deactivated')

          allow(Provider).to receive(:find) { raise StandardError }

          put "/administrador/fornecedores/#{provider.id}/status",
              params: { status: new_status }

          expect(response).to redirect_to(admin_panel_fornecedores_path)
        end
      end
    end
  end

  describe 'POST actions' do
    context 'when pass valid params' do
      it 'creates new provider' do
        provider_params = FactoryBot.attributes_for(:provider)

        post '/administrador/fornecedores/create', params: { provider: provider_params }

        result = Provider.find_by_document(provider_params[:document])

        expect(result).to be_present
      end

      it 'shows success message' do
        provider_params = FactoryBot.attributes_for(:provider)

        post '/administrador/fornecedores/create', params: { provider: provider_params }

        expect(flash[:notice]).to eq('Dados gravados com sucesso!')
      end

      it 'redirects to providers page' do
        provider_params = FactoryBot.attributes_for(:provider)

        post '/administrador/fornecedores/create', params: { provider: provider_params }

        expect(response).to redirect_to(admin_panel_fornecedores_path)
      end
    end

    context 'when pass invalid params' do
      it 'no creates new provider' do
        provider_params = FactoryBot.attributes_for(:provider, name: nil)

        post '/administrador/fornecedores/create', params: { provider: provider_params }

        result = Provider.find_by_document(provider_params[:document])

        expect(result).to be_nil
      end

      it 'shows error message' do
        provider_params = FactoryBot.attributes_for(:provider, name: nil)

        post '/administrador/fornecedores/create', params: { provider: provider_params }

        expect(flash[:alert]).to eq('Erro ao gravar dados!')
      end

      it 'redirects to providers page' do
        provider_params = FactoryBot.attributes_for(:provider, name: nil)

        post '/administrador/fornecedores/create', params: { provider: provider_params }

        expect(response).to redirect_to(admin_panel_fornecedores_path)
      end
    end
  end

  describe 'DELETE actions' do
    describe '#delete' do
      context 'and pass valid params' do
        it 'deletes provider' do
          provider = FactoryBot.create(:provider)

          new_name = 'João da Silva'

          delete "/administrador/fornecedores/#{provider.id}/delete"

          result = Provider.find_by_name(new_name)

          expect(result).to be_nil
        end

        it 'redirects to providers page' do
          provider = FactoryBot.create(:provider)

          delete "/administrador/fornecedores/#{provider.id}/delete"

          expect(response).to redirect_to(admin_panel_fornecedores_path)
        end

        it 'shows success message' do
          provider = FactoryBot.create(:provider)

          delete "/administrador/fornecedores/#{provider.id}/delete"

          expect(flash[:notice]).to eq('Dados removidos com sucesso!')
        end
      end

      context 'when occurs errors' do
        it 'no deletes provider' do
          provider = FactoryBot.create(:provider)

          allow(Provider).to receive(:find) { raise StandardError }

          delete "/administrador/fornecedores/#{provider.id}/delete"

          result = Provider.find_by_name(provider.name)

          expect(result).to be_present
        end

        it 'redirects to providers page' do
          provider = FactoryBot.create(:provider)

          allow(Provider).to receive(:find) { raise StandardError }

          delete "/administrador/fornecedores/#{provider.id}/delete"

          expect(response).to redirect_to(admin_panel_fornecedores_path)
        end

        it 'shows success message' do
          provider = FactoryBot.create(:provider)

          allow(Provider).to receive(:find) { raise StandardError }

          delete "/administrador/fornecedores/#{provider.id}/delete"

          expect(flash[:alert]).to eq('Erro ao remover dados!')
        end
      end
    end
  end
end
