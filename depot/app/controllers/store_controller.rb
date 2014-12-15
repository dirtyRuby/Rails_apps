class StoreController < ApplicationController
  include SessionsCount
  include CurrentCart
  skip_before_action :authorize
  before_action :set_cart

  def index
    session[:counter] = session_count session[:counter]
    @counter = session[:counter]
    if params[:set_locale]
      redirect_to store_url(locale: params[:set_locale])
    else
      @products = Product.where(["product_locale = ? ", I18n.locale.to_s])
    end
  end
end
