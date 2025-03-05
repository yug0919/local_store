class CartsController < ApplicationController
    before_action :authenticate_customer!
    before_action :set_cart
    def show
      @cart = current_cart
    end
    
    def add
      product = Product.find(params[:product_id])
      item = current_cart.cart_items.find_or_initialize_by(product: product)
      item.quantity ||= 0
      item.quantity =item.quantity+1
      if item.save
        redirect_to cart_path, notice: "#{product.name} added to cart."
      else
        redirect_to products_path, alert: "Could not add product to cart."
      end
    end
  
    def remove
      item = current_cart.cart_items.find_by(product_id: params[:product_id])
      item.destroy if item
      redirect_to cart_path, notice: "Item removed from cart."
    end
    
    def update
      item = current_cart.cart_items.find_by(product_id: params[:product_id])
      if item.update(quantity: params[:quantity])
        redirect_to cart_path, notice: "Cart updated."
      else
        redirect_to cart_path, alert: "Could not update cart."
      end
    end
  
    private
    def current_cart
      current_customer.cart || current_customer.create_cart
    end

  def set_cart
    @cart = Cart.find_or_create_by(customer_id: current_customer.id)
  end
  

end