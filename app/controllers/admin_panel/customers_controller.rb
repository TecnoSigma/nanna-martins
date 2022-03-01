# frozen_string_literal: true

class AdminPanel::CustomersController < ApplicationController
  before_action :authenticate_user!

  def index
    @customers = Customer.ordered_by_name
  end
end
