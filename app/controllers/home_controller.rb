class HomeController < ApplicationController
  def index
    @clothing_news = Clothing.where(new: true)
  end
end
