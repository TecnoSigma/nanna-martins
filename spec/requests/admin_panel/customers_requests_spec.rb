#frozen_string_literal: true

require 'rails_helper'

include ControllerMacros

RSpec.describe AdminPanel::CustomersController, type: :request do
  before(:each) { login_user }

  describe 'GET actions' do
    describe '#index' do
      it 'renders customers page' do
        get '/administrador/clientes'

        expect(response).to render_template(:index)
      end
    end

    describe '#edit' do
      context 'when customer is found' do
        it 'renders customers edit page' do
          customer = FactoryBot.create(:customer)

          get "/administrador/clientes/#{customer.id}/editar"

          expect(response).to render_template(:edit)
        end
      end

      context 'when customer is not found' do
        it 'redirects to customers page' do
          get "/administrador/clientes/incorrect_id/editar"

          expect(response).to redirect_to(admin_panel_clientes_path)
        end

        it 'shows error message' do
          get "/administrador/clientes/incorrect_id/editar"

          expect(flash[:alert]).to eq('Erro ao procurar dados!')
        end
      end

      context 'when occurs errors' do
        it 'redirects to customers page' do
          customer = FactoryBot.create(:customer)

          allow(Customer).to receive(:find) { raise StandardError }

          get "/administrador/clientes/#{customer.id}/editar"

          expect(response).to redirect_to(admin_panel_clientes_path)
        end

        it 'shows error message' do
          customer = FactoryBot.create(:customer)

          allow(Customer).to receive(:find) { raise StandardError }

          get "/administrador/clientes/#{customer.id}/editar"

          expect(flash[:alert]).to eq('Erro ao procurar dados!')
        end
      end
    end
  end

  describe 'PUT actions' do
    describe '#update' do
      context 'when customer is found' do
        context 'and pass valid params' do
          it 'updates customer data' do
            customer = FactoryBot.create(:customer)

            new_name = 'João da Silva'

            put "/administrador/clientes/#{customer.id}/update", params: { customer: { name: new_name } }

            result = Customer.find_by_name(new_name)

            expect(result).to be_present
          end

          it 'redirects to customers page' do
            customer = FactoryBot.create(:customer)

            new_name = 'João da Silva'

            put "/administrador/clientes/#{customer.id}/update", params: { customer: { name: new_name } }

            expect(response).to redirect_to(admin_panel_clientes_path)
          end

          it 'shows success message' do
            customer = FactoryBot.create(:customer)

            new_name = 'João da Silva'

            put "/administrador/clientes/#{customer.id}/update", params: { customer: { name: new_name } }

            expect(flash[:notice]).to eq('Dados atualizados com sucesso!')
          end
        end

        context 'and pass invalid params' do
          it 'updates customer data' do
            customer = FactoryBot.create(:customer)

            new_document = '123456'

            put "/administrador/clientes/#{customer.id}/update", params: { customer: { document: new_document } }

            result = Customer.find_by_document(new_document)

            expect(result).to be_nil
          end

          it 'redirects to customers page' do
            customer = FactoryBot.create(:customer)

            new_document = '123456'

            put "/administrador/clientes/#{customer.id}/update", params: { customer: { document: new_document } }

            expect(response).to redirect_to(admin_panel_clientes_path)
          end

          it 'shows error message' do
            customer = FactoryBot.create(:customer)

            new_document = '123456'

            put "/administrador/clientes/#{customer.id}/update", params: { customer: { document: new_document } }

            expect(flash[:alert]).to eq('Erro ao atualizar dados!')
          end
        end
      end

      context 'when customer is not found' do
        it 'redirects to customers page' do
          new_name = 'João da Silva'

          put "/administrador/clientes/incorrect_id/update", params: { customer: { name: new_name } }

          expect(response).to redirect_to(admin_panel_clientes_path)
        end

        it 'shows error message' do
          new_name = 'João da Silva'

          put "/administrador/clientes/incorrect_id/update", params: { customer: { name: new_name } }

          expect(flash[:alert]).to eq('Erro ao atualizar dados!')
        end
      end

      context 'when occurs errors' do
        it 'no updates customer data' do
          customer = FactoryBot.create(:customer)

          new_name = 'João da Silva'

          allow(Customer).to receive(:find) { raise StandardError }

          put "/administrador/clientes/#{customer.id}/update", params: { customer: { name: new_name } }

          result = Customer.find_by_name(new_name)

          expect(result).to be_nil
        end

        it 'redirects to customers page' do
          customer = FactoryBot.create(:customer)

          new_name = 'João da Silva'

          allow(Customer).to receive(:find) { raise StandardError }

          put "/administrador/clientes/#{customer.id}/update", params: { customer: { name: new_name } }

          expect(response).to redirect_to(admin_panel_clientes_path)
        end

        it 'shows error message' do
          customer = FactoryBot.create(:customer)

          new_name = 'João da Silva'

          allow(Customer).to receive(:find) { raise StandardError }

          put "/administrador/clientes/#{customer.id}/update", params: { customer: { name: new_name } }

          expect(flash[:alert]).to eq('Erro ao atualizar dados!')
        end
      end

      describe '#change_status' do
        context 'when status is valid' do
          it 'updates status' do
            login_user

            new_status = 'activated'
            customer = FactoryBot.create(:customer, status: 'deactivated')

            put "/administrador/clientes/#{customer.id}/status",
                params: { status: new_status }

            result = Customer.find_by_document(customer.document).status

            expect(result).to eq(new_status)
          end

          it 'shows success message' do
            login_user

            new_status = 'activated'
            customer = FactoryBot.create(:customer, status: 'deactivated')

            put "/administrador/clientes/#{customer.id}/status",
                params: { status: new_status }

            expect(flash[:notice]).to eq('Dados atualizados com sucesso!')
          end

          it 'redirects to customers page' do
            login_user

            new_status = 'activated'
            customer = FactoryBot.create(:customer, status: 'deactivated')

            put "/administrador/clientes/#{customer.id}/status",
                params: { status: new_status }

            expect(response).to redirect_to(admin_panel_clientes_path)
          end
        end

        context 'when status is invalid' do
          it 'no updates status' do
            login_user

            new_status = 'invalid_status'
            customer = FactoryBot.create(:customer, status: 'deactivated')

            put "/administrador/clientes/#{customer.id}/status",
                params: { status: new_status }

            result = Customer.find_by_document(customer.document).status

            expect(result).not_to eq(new_status)
          end

          it 'shows error message' do
            login_user

            new_status = 'invalid_status'
            customer = FactoryBot.create(:customer, status: 'deactivated')

            put "/administrador/clientes/#{customer.id}/status",
                params: { status: new_status }

            expect(flash[:alert]).to eq('Erro ao atualizar dados!')
          end

          it 'redirects to customers page' do
            login_user

            new_status = 'invalid_status'
            customer = FactoryBot.create(:customer, status: 'deactivated')

            put "/administrador/clientes/#{customer.id}/status",
                params: { status: new_status }

            expect(response).to redirect_to(admin_panel_clientes_path)
          end
        end

        context 'when customer is not found' do
          it 'shows error message' do
            login_user

            new_status = 'invalid_status'

            put "/administrador/clientes/invalid_id/status",
                params: { status: new_status }

            expect(flash[:alert]).to eq('Erro ao atualizar dados!')
          end

          it 'redirects to customers page' do
            login_user

            new_status = 'invalid_status'

            put "/administrador/clientes/invalid_id/status",
                params: { status: new_status }

            expect(response).to redirect_to(admin_panel_clientes_path)
          end
        end

        context 'when occurs errors' do
          it 'no updates status' do
            login_user

            new_status = 'activated'
            customer = FactoryBot.create(:customer, status: 'deactivated')

            allow(Customer).to receive(:find) { raise StandardError }

            put "/administrador/clientes/#{customer.id}/status",
                params: { status: new_status }

            result = Customer.find_by_document(customer.document).status

            expect(result).not_to eq(new_status)
          end

          it 'shows error message' do
            login_user

            new_status = 'activated'
            customer = FactoryBot.create(:customer, status: 'deactivated')

            allow(Customer).to receive(:find) { raise StandardError }

            put "/administrador/clientes/#{customer.id}/status",
                params: { status: new_status }

            expect(flash[:alert]).to eq('Erro ao atualizar dados!')
          end

          it 'redirects to customers page' do
            login_user

            new_status = 'activated'
            customer = FactoryBot.create(:customer, status: 'deactivated')

            allow(Customer).to receive(:find) { raise StandardError }

            put "/administrador/clientes/#{customer.id}/status",
                params: { status: new_status }

            expect(response).to redirect_to(admin_panel_clientes_path)
          end
        end
      end
    end

    describe '#new' do
      it 'renders new customer page' do
        get '/administrador/clientes/novo'

        expect(response).to render_template(:new)
      end
    end
  end

  describe 'POST actions' do
    context 'when pass valid params' do
      it 'creates new customer' do
        customer_params = FactoryBot.attributes_for(:customer)

        post '/administrador/clientes/create', params: { customer: customer_params }

        result = Customer.find_by_document(customer_params[:document])

        expect(result).to be_present
      end

      it 'shows success message' do
        customer_params = FactoryBot.attributes_for(:customer)

        post '/administrador/clientes/create', params: { customer: customer_params }

        expect(flash[:notice]).to eq('Dados gravados com sucesso!')
      end

      it 'redirects to customers page' do
        customer_params = FactoryBot.attributes_for(:customer)

        post '/administrador/clientes/create', params: { customer: customer_params }

        expect(response).to redirect_to(admin_panel_clientes_path)
      end
    end

    context 'when pass invalid params' do
      it 'no creates new customer' do
        customer_params = FactoryBot.attributes_for(:customer, name: nil)

        post '/administrador/clientes/create', params: { customer: customer_params }

        result = Customer.find_by_document(customer_params[:document])

        expect(result).to be_nil
      end

      it 'shows error message' do
        customer_params = FactoryBot.attributes_for(:customer, name: nil)

        post '/administrador/clientes/create', params: { customer: customer_params }

        expect(flash[:alert]).to eq('Erro ao gravar dados!')
      end

      it 'redirects to customers page' do
        customer_params = FactoryBot.attributes_for(:customer, name: nil)

        post '/administrador/clientes/create', params: { customer: customer_params }

        expect(response).to redirect_to(admin_panel_clientes_path)
      end
    end
  end

  describe 'DELETE actions' do
    describe '#delete' do
      context 'and pass valid params' do
        it 'deletes customer' do
          customer = FactoryBot.create(:customer)

          new_name = 'João da Silva'

          delete "/administrador/clientes/#{customer.id}/delete"

          result = Customer.find_by_name(new_name)

          expect(result).to be_nil
        end

        it 'redirects to customers page' do
          customer = FactoryBot.create(:customer)

          delete "/administrador/clientes/#{customer.id}/delete"

          expect(response).to redirect_to(admin_panel_clientes_path)
        end

        it 'shows success message' do
          customer = FactoryBot.create(:customer)

          delete "/administrador/clientes/#{customer.id}/delete"

          expect(flash[:notice]).to eq('Dados removidos com sucesso!')
        end
      end

      context 'when occurs errors' do
        it 'no deletes customer' do
          customer = FactoryBot.create(:customer)

          allow(Customer).to receive(:find) { raise StandardError }

          delete "/administrador/clientes/#{customer.id}/delete"

          result = Customer.find_by_name(customer.name)

          expect(result).to be_present
        end

        it 'redirects to customers page' do
          customer = FactoryBot.create(:customer)

          allow(Customer).to receive(:find) { raise StandardError }

          delete "/administrador/clientes/#{customer.id}/delete"

          expect(response).to redirect_to(admin_panel_clientes_path)
        end

        it 'shows success message' do
          customer = FactoryBot.create(:customer)

          allow(Customer).to receive(:find) { raise StandardError }

          delete "/administrador/clientes/#{customer.id}/delete"

          expect(flash[:alert]).to eq('Erro ao remover dados!')
        end
      end
    end
  end
end
