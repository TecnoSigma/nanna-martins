# frozen_string_literal: true

class AdminPanel::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index; end

  private

  def change_status!(klass)
    klass
      .find(params['id'])
      .update!(status: params['status'])
  end
end
