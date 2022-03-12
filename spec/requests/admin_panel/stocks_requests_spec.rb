#frozen_string_literal: true

require 'rails_helper'

include ControllerMacros

RSpec.describe AdminPanel::StocksController, type: :request do
  before(:each) { login_user }

  describe 'GET actions' do
    describe '#index' do
      it 'renders stocks page' do
        get '/administrador/estoques'

        expect(response).to render_template(:index)
      end
    end

    describe '#edit' do
      context 'when stock is found' do
        it 'renders stocks edit page' do
          stock = FactoryBot.create(:stock)

          get "/administrador/estoques/#{stock.id}/editar"

          expect(response).to render_template(:edit)
        end
      end

      context 'when stock is not found' do
        it 'redirects to stocks page' do
          get "/administrador/estoques/incorrect_id/editar"

          expect(response).to redirect_to(admin_panel_estoques_path)
        end

        it 'shows error message' do
          get "/administrador/estoques/incorrect_id/editar"

          expect(flash[:alert]).to eq('Erro ao procurar dados!')
        end
      end

      context 'when occurs errors' do
        it 'redirects to stocks page' do
          stock = FactoryBot.create(:stock)

          allow(Stock).to receive(:find) { raise StandardError }

          get "/administrador/estoques/#{stock.id}/editar"

          expect(response).to redirect_to(admin_panel_estoques_path)
        end

        it 'shows error message' do
          stock = FactoryBot.create(:stock)

          allow(Stock).to receive(:find) { raise StandardError }

          get "/administrador/estoques/#{stock.id}/editar"

          expect(flash[:alert]).to eq('Erro ao procurar dados!')
        end
      end
    end
  end

  describe 'PUT actions' do
    describe '#update' do
      context 'when stock is found' do
        context 'and pass valid params' do
          it 'updates stock data' do
            stock = FactoryBot.create(:stock)

            new_item = 'Barbante tamanho 12'

            put "/administrador/estoques/#{stock.id}/update", params: { stock: { name: new_item } }

            result = Stock.find_by_name(new_item)

            expect(result).to be_present
          end

          it 'redirects to stocks page' do
            stock = FactoryBot.create(:stock)

            new_item = 'Barbante tamanho 12'

            put "/administrador/estoques/#{stock.id}/update", params: { stock: { name: new_item } }

            expect(response).to redirect_to(admin_panel_estoques_path)
          end

          it 'shows success message' do
            stock = FactoryBot.create(:stock)

            new_item = 'Barbante tamanho 12'

            put "/administrador/estoques/#{stock.id}/update", params: { stock: { name: new_item } }

            expect(flash[:notice]).to eq('Dados atualizados com sucesso!')
          end
        end

        context 'and pass invalid params' do
          it 'updates stock data' do
            stock = FactoryBot.create(:stock)

            new_name = ''

            put "/administrador/estoques/#{stock.id}/update", params: { stock: { name: new_name } }

            result = Stock.find_by_name(new_name)

            expect(result).to be_nil
          end

          it 'redirects to stocks page' do
            stock = FactoryBot.create(:stock)

            new_name = ''

            put "/administrador/estoques/#{stock.id}/update", params: { stock: { name: new_name } }

            expect(response).to redirect_to(admin_panel_estoques_path)
          end

          it 'shows error message' do
            stock = FactoryBot.create(:stock)

            new_name = ''

            put "/administrador/estoques/#{stock.id}/update", params: { stock: { name: new_name } }

            expect(flash[:alert]).to eq('Erro ao atualizar dados!')
          end
        end
      end

      context 'when stock is not found' do
        it 'redirects to stocks page' do
          new_item = 'Barbante tamanho 12'

          put "/administrador/estoques/incorrect_id/update", params: { stock: { name: new_item } }

          expect(response).to redirect_to(admin_panel_estoques_path)
        end

        it 'shows error message' do
          new_item = 'Barbante tamanho 12'

          put "/administrador/estoques/incorrect_id/update", params: { stock: { name: new_item } }

          expect(flash[:alert]).to eq('Erro ao atualizar dados!')
        end
      end

      context 'when occurs errors' do
        it 'no updates stock data' do
          stock = FactoryBot.create(:stock)

          new_item = 'Barbante tamanho 12'

          allow(Stock).to receive(:find) { raise StandardError }

          put "/administrador/estoques/#{stock.id}/update", params: { stock: { name: new_item } }

          result = Stock.find_by_name(new_item)

          expect(result).to be_nil
        end

        it 'redirects to stocks page' do
          stock = FactoryBot.create(:stock)

          new_item = 'Barbante tamanho 12'

          allow(Stock).to receive(:find) { raise StandardError }

          put "/administrador/estoques/#{stock.id}/update", params: { stock: { name: new_item } }

          expect(response).to redirect_to(admin_panel_estoques_path)
        end

        it 'shows error message' do
          stock = FactoryBot.create(:stock)

          new_item = 'Barbante tamanho 12'

          allow(Stock).to receive(:find) { raise StandardError }

          put "/administrador/estoques/#{stock.id}/update", params: { stock: { name: new_item } }

          expect(flash[:alert]).to eq('Erro ao atualizar dados!')
        end
      end

      describe '#status' do
        context 'when status is valid' do
          it 'updates status' do
            login_user

            new_status = 'activated'
            stock = FactoryBot.create(:stock, status: 'deactivated')

            put "/administrador/estoques/#{stock.id}/status",
                params: { status: new_status }

            result = Stock.find_by_name(stock.name).status

            expect(result).to eq(new_status)
          end

          it 'shows success message' do
            login_user

            new_status = 'activated'
            stock = FactoryBot.create(:stock, status: 'deactivated')

            put "/administrador/estoques/#{stock.id}/status",
                params: { status: new_status }

            expect(flash[:notice]).to eq('Dados atualizados com sucesso!')
          end

          it 'redirects to stocks page' do
            login_user

            new_status = 'activated'
            stock = FactoryBot.create(:stock, status: 'deactivated')

            put "/administrador/estoques/#{stock.id}/status",
                params: { status: new_status }

            expect(response).to redirect_to(admin_panel_estoques_path)
          end
        end

        context 'when status is invalid' do
          it 'no updates status' do
            login_user

            new_status = 'invalid_status'
            stock = FactoryBot.create(:stock, status: 'deactivated')

            put "/administrador/estoques/#{stock.id}/status",
                params: { status: new_status }

            result = Stock.find_by_name(stock.name).status

            expect(result).not_to eq(new_status)
          end

          it 'shows error message' do
            login_user

            new_status = 'invalid_status'
            stock = FactoryBot.create(:stock, status: 'deactivated')

            put "/administrador/estoques/#{stock.id}/status",
                params: { status: new_status }

            expect(flash[:alert]).to eq('Erro ao atualizar dados!')
          end

          it 'redirects to stocks page' do
            login_user

            new_status = 'invalid_status'
            stock = FactoryBot.create(:stock, status: 'deactivated')

            put "/administrador/estoques/#{stock.id}/status",
                params: { status: new_status }

            expect(response).to redirect_to(admin_panel_estoques_path)
          end
        end

        context 'when stock is not found' do
          it 'shows error message' do
            login_user

            new_status = 'invalid_status'

            put "/administrador/estoques/invalid_id/status",
                params: { status: new_status }

            expect(flash[:alert]).to eq('Erro ao atualizar dados!')
          end

          it 'redirects to stocks page' do
            login_user

            new_status = 'invalid_status'

            put "/administrador/estoques/invalid_id/status",
                params: { status: new_status }

            expect(response).to redirect_to(admin_panel_estoques_path)
          end
        end

        context 'when occurs errors' do
          it 'no updates status' do
            login_user

            new_status = 'activated'
            stock = FactoryBot.create(:stock, status: 'deactivated')

            allow(Stock).to receive(:find) { raise StandardError }

            put "/administrador/estoques/#{stock.id}/status",
                params: { status: new_status }

            result = Stock.find_by_name(stock.name).status

            expect(result).not_to eq(new_status)
          end

          it 'shows error message' do
            login_user

            new_status = 'activated'
            stock = FactoryBot.create(:stock, status: 'deactivated')

            allow(Stock).to receive(:find) { raise StandardError }

            put "/administrador/estoques/#{stock.id}/status",
                params: { status: new_status }

            expect(flash[:alert]).to eq('Erro ao atualizar dados!')
          end

          it 'redirects to stocks page' do
            login_user

            new_status = 'activated'
            stock = FactoryBot.create(:stock, status: 'deactivated')

            allow(Stock).to receive(:find) { raise StandardError }

            put "/administrador/estoques/#{stock.id}/status",
                params: { status: new_status }

            expect(response).to redirect_to(admin_panel_estoques_path)
          end
        end
      end
    end

    describe '#new' do
      it 'renders new stock page' do
        get '/administrador/estoques/novo'

        expect(response).to render_template(:new)
      end
    end
  end

  describe 'POST actions' do
    context 'when pass valid params' do
      it 'creates new stock' do
        stock_params = FactoryBot.attributes_for(:stock)

        post '/administrador/estoques/create', params: { stock: stock_params }

        result = Stock.find_by_name(stock_params[:name])

        expect(result).to be_present
      end

      it 'shows success message' do
        stock_params = FactoryBot.attributes_for(:stock)

        post '/administrador/estoques/create', params: { stock: stock_params }

        expect(flash[:notice]).to eq('Dados gravados com sucesso!')
      end

      it 'redirects to stocks page' do
        stock_params = FactoryBot.attributes_for(:stock)

        post '/administrador/estoques/create', params: { stock: stock_params }

        expect(response).to redirect_to(admin_panel_estoques_path)
      end
    end

    context 'when pass invalid params' do
      it 'no creates new stock' do
        stock_params = FactoryBot.attributes_for(:stock, name: nil)

        post '/administrador/estoques/create', params: { stock: stock_params }

        result = Stock.find_by_name(stock_params[:name])

        expect(result).to be_nil
      end

      it 'shows error message' do
        stock_params = FactoryBot.attributes_for(:stock, name: nil)

        post '/administrador/estoques/create', params: { stock: stock_params }

        expect(flash[:alert]).to eq('Erro ao gravar dados!')
      end

      it 'redirects to stocks page' do
        stock_params = FactoryBot.attributes_for(:stock, name: nil)

        post '/administrador/estoques/create', params: { stock: stock_params }

        expect(response).to redirect_to(admin_panel_estoques_path)
      end
    end
  end

  describe 'DELETE actions' do
    describe '#delete' do
      context 'and pass valid params' do
        it 'deletes stock' do
          stock = FactoryBot.create(:stock)

          new_item = 'Barbante tamanho 12'

          delete "/administrador/estoques/#{stock.id}/delete"

          result = Stock.find_by_name(new_item)

          expect(result).to be_nil
        end

        it 'redirects to stocks page' do
          stock = FactoryBot.create(:stock)

          delete "/administrador/estoques/#{stock.id}/delete"

          expect(response).to redirect_to(admin_panel_estoques_path)
        end

        it 'shows success message' do
          stock = FactoryBot.create(:stock)

          delete "/administrador/estoques/#{stock.id}/delete"

          expect(flash[:notice]).to eq('Dados removidos com sucesso!')
        end
      end

      context 'when occurs errors' do
        it 'no deletes stock' do
          stock = FactoryBot.create(:stock)

          allow(Stock).to receive(:find) { raise StandardError }

          delete "/administrador/estoques/#{stock.id}/delete"

          result = Stock.find_by_name(stock.name)

          expect(result).to be_present
        end

        it 'redirects to stocks page' do
          stock = FactoryBot.create(:stock)

          allow(Stock).to receive(:find) { raise StandardError }

          delete "/administrador/estoques/#{stock.id}/delete"

          expect(response).to redirect_to(admin_panel_estoques_path)
        end

        it 'shows success message' do
          stock = FactoryBot.create(:stock)

          allow(Stock).to receive(:find) { raise StandardError }

          delete "/administrador/estoques/#{stock.id}/delete"

          expect(flash[:alert]).to eq('Erro ao remover dados!')
        end
      end
    end
  end
end
