class OrdersController < ApplicationController
    before_action :authenticate_customer!  
    
  
    def create
      product = Product.find(order_params[:product_id])  
  
      order = current_customer.orders.create!(
        total_amount: product.price,
        status: "pending",
        order_date: Time.current
      )
  
      OrderItem.create!(
        order: order,
        product_id: product.id,
        quantity: 1,
        price: product.price
      )
  
      redirect_to root_path, notice: "Order placed successfully!"
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "Product not found!"
    rescue => e
      redirect_to root_path, alert: "Something went wrong: #{e.message}"
    end
  
    private
  
    def order_params
      params.require(:order).permit(:product_id)
    end
  end
  