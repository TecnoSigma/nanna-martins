# frozen_string_literal: true

class AdminPanel::CustomersController < AdminPanel::DashboardController
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

  def edit
    @customer = Customer.find(params['id'])
  rescue StandardError => error
    Rails.logger.error("Message: #{error.message} - Backtrace: #{error.backtrace}")

    redirect_to admin_panel_clientes_path, alert: t('messages.errors.search_data_failed')
  end

  def update
    customer = Customer.find(params['id'])
    customer.update!(customer_params)

    redirect_to admin_panel_clientes_path, notice: t('messages.successes.updated_data_successfully')
  rescue StandardError => error
    Rails.logger.error("Message: #{error.message} - Backtrace: #{error.backtrace}")

    redirect_to admin_panel_clientes_path, alert: t('messages.errors.update_data_failed')
  end

  def delete
    customer = Customer.find(params['id'])
    customer.delete

    redirect_to admin_panel_clientes_path, notice: t('messages.successes.deleted_data_successfully')
  rescue StandardError => error
    Rails.logger.error("Message: #{error.message} - Backtrace: #{error.backtrace}")

    redirect_to admin_panel_clientes_path, alert: t('messages.errors.delete_data_failed')
  end

  def status
    change_status!(Customer)

    redirect_to admin_panel_clientes_path, notice: t('messages.successes.updated_data_successfully')
  rescue StandardError => error
    Rails.logger.error("Message: #{error.message} - Backtrace: #{error.backtrace}")

    redirect_to admin_panel_clientes_path, alert: t('messages.errors.update_data_failed')
  end

  private

  def customer_params
    params
      .require(:customer)
      .permit(:name, :kind, :contact, :document, :address, :number, :complement, :district, :city,
              :state, :postal_code, :telephone, :cellphone, :site, :email)
  end
end
