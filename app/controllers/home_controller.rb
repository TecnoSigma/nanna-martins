class HomeController < ApplicationController
  def index
    @clothings = Clothing.all
  end
end
