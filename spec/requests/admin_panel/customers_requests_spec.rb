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
end
