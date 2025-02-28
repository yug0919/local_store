class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    @products = Product.all
    @customers = Customer.all
    @orders = Order.all
    @total_balance = Customer.sum(:balance)
    @total_customers = Customer.count
    @total_sales = Order.sum(:total_amount)
    @total_products = Product.count

  end
  
  private
  def require_admin
    unless admin_signed_in? && current_admin.active?
      redirect_to new_admin_session_path, alert: "Unauthorized access"
    end
  end
  
end
