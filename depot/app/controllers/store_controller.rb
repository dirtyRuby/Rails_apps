class StoreController < ApplicationController
  include SessionsCount
  def index
  	@products = Product.order(:title)
    session[:counter] = session_count session[:counter]
    @counter = session[:counter]
  end
end
