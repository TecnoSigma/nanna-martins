# frozen_string_literal: true

class AdminPanel::InspirationsController < AdminPanel::DashboardController
  before_action :authenticate_user!

  def index; end

  def pinterest
    @pins = Pin.all
  end
end
