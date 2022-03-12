# frozen_string_literal: true

class AdminPanel::StocksController < AdminPanel::DashboardController
  before_action :authenticate_user!

  def index
    @stocks = Stock.ordered_by_name
  end

  def new
    @stock = Stock.new
  end

  def create
    new_stock = Stock.new(stock_params)
    new_stock.validate!
    new_stock.save!

    redirect_to admin_panel_estoques_path, notice: t('messages.successes.saved_data_successfully')
  rescue StandardError => error
    Rails.logger.error("Message: #{error.message} - Backtrace: #{error.backtrace}")

    redirect_to admin_panel_estoques_path, alert: t('messages.errors.save_data_failed')
  end

  def edit
    @stock = Stock.find(params['id'])
  rescue StandardError => error
    Rails.logger.error("Message: #{error.message} - Backtrace: #{error.backtrace}")

    redirect_to admin_panel_estoques_path, alert: t('messages.errors.search_data_failed')
  end

  def update
    stock = Stock.find(params['id'])
    stock.update!(stock_params)

    redirect_to admin_panel_estoques_path, notice: t('messages.successes.updated_data_successfully')
  rescue StandardError => error
    Rails.logger.error("Message: #{error.message} - Backtrace: #{error.backtrace}")

    redirect_to admin_panel_estoques_path, alert: t('messages.errors.update_data_failed')
  end

  def delete
    stock = Stock.find(params['id'])
    stock.delete

    redirect_to admin_panel_estoques_path, notice: t('messages.successes.deleted_data_successfully')
  rescue StandardError => error
    Rails.logger.error("Message: #{error.message} - Backtrace: #{error.backtrace}")

    redirect_to admin_panel_estoques_path, alert: t('messages.errors.delete_data_failed')
  end

  def status
    change_status!(Stock)

    redirect_to admin_panel_estoques_path, notice: t('messages.successes.updated_data_successfully')
  rescue StandardError => error
    Rails.logger.error("Message: #{error.message} - Backtrace: #{error.backtrace}")

    redirect_to admin_panel_estoques_path, alert: t('messages.errors.update_data_failed')
  end

  private

  def stock_params
    params
      .require(:stock)
      .permit(:name, :price, :reference, :measurement_unit, :quantity, :description)	
  end
end
