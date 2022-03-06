# frozen_string_literal: true

class AdminPanel::ProvidersController < AdminPanel::DashboardController
  before_action :authenticate_user!

  def index
    @providers = Provider.ordered_by_name
  end

  def new
    @provider = Provider.new
  end

  def create
    new_provider = Provider.new(provider_params)
    new_provider.validate!
    new_provider.save!

    redirect_to admin_panel_fornecedores_path, notice: t('messages.successes.saved_data_successfully')
  rescue StandardError => error
    Rails.logger.error("Message: #{error.message} - Backtrace: #{error.backtrace}")

    redirect_to admin_panel_fornecedores_path, alert: t('messages.errors.save_data_failed')
  end

  def edit
    @provider = Provider.find(params['id'])
  rescue StandardError => error
    Rails.logger.error("Message: #{error.message} - Backtrace: #{error.backtrace}")

    redirect_to admin_panel_fornecedores_path, alert: t('messages.errors.search_data_failed')
  end

  def update
    provider = Provider.find(params['id'])
    provider.update!(provider_params)

    redirect_to admin_panel_fornecedores_path, notice: t('messages.successes.updated_data_successfully')
  rescue StandardError => error
    Rails.logger.error("Message: #{error.message} - Backtrace: #{error.backtrace}")

    redirect_to admin_panel_fornecedores_path, alert: t('messages.errors.update_data_failed')
  end

  def delete
    provider = Provider.find(params['id'])
    provider.delete

    redirect_to admin_panel_fornecedores_path, notice: t('messages.successes.deleted_data_successfully')
  rescue StandardError => error
    Rails.logger.error("Message: #{error.message} - Backtrace: #{error.backtrace}")

    redirect_to admin_panel_fornecedores_path, alert: t('messages.errors.delete_data_failed')
  end

  def status
    change_status!(Provider)

    redirect_to admin_panel_fornecedores_path, notice: t('messages.successes.updated_data_successfully')
  rescue StandardError => error
    Rails.logger.error("Message: #{error.message} - Backtrace: #{error.backtrace}")

    redirect_to admin_panel_fornecedores_path, alert: t('messages.errors.update_data_failed')
  end

  private

  def provider_params
    params
      .require(:provider)
      .permit(:name, :kind, :contact, :document, :address, :number, :complement, :district, :city,
              :state, :postal_code, :telephone, :site, :email)
  end
end
