class HomeController < ApplicationController
  before_action :set_cart

def set_cart
  @cart = Cart.find_or_create_by(customer_id: current_customer&.id) if customer_signed_in?
end
  def index
    @products = Product.all
  end

end
