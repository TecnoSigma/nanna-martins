# frozen_string_literal: true

class AdminPanel::CustomersController < ApplicationController
  before_action :authenticate_user!

  def index
    @customers = Customer.ordered_by_name
  end

  def new
    @customer = Customer.new
  end

  def create
    new_customer = Customer.new(customer_params)
    new_customer.validate!
    new_customer.save!

    redirect_to admin_panel_clientes_path, notice: t('messages.successes.saved_data_successfully')
  rescue StandardError => error
    Rails.logger.error("Message: #{error.message} - Backtrace: #{error.backtrace}")

    redirect_to admin_panel_clientes_path, alert: t('messages.errors.save_data_failed')
  end

  private

  def customer_params
    params
      .require(:customer)
      .permit(:name, :kind, :contact, :document, :address, :number, :complement, :district, :city,
              :state, :postal_code, :telephone, :cellphone, :site, :email)
  end
end
