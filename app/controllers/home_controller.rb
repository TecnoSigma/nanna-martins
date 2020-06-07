class HomeController < ApplicationController
  def index
    @news = (Clothing.where(new: true) + Accessory.where(new: true)).shuffle
  end
end
