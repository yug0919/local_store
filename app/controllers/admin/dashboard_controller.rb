class Admin::DashboardController < Admin::BaseController



  def index
    @products = Product.all
    @customers = Customer.all
    @orders = Order.all
    @total_balance = Customer.sum(:balance)
    @total_customers = Customer.count
    @total_sales = Order.sum(:total_amount)
    @total_products = Product.count
  end
  
  
  
end
