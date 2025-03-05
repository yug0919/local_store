class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def create
    cart = current_cart
    order = current_customer.orders.create(total_amount: cart.cart_items.sum { |item| item.product.price * item.quantity }, status: 'pending', order_date: Time.current)
    
    cart.cart_items.each do |item|
      order.order_items.create(product: item.product, quantity: item.quantity, price: item.product.price)
    end
    
    cart.cart_items.destroy_all
    redirect_to order_path(order), notice: "Order placed successfully!"
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  def index
    @orders = current_customer.orders
  end
  private
  def current_cart
    current_customer.cart || current_customer.create_cart
  end
  end
  