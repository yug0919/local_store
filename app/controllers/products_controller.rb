class ProductsController < ApplicationController
    before_action :set_cart

    def set_cart
      @cart = Cart.find_or_create_by(customer_id: current_customer&.id) if customer_signed_in?
    end
    def index
        @products = Product.all
        # render json: @products
    end
    def show
        @product = Product.find(params[:id])
          @cart = current_customer.cart || current_customer.create_cart if customer_signed_in?

        # render json: @product
    end
    def create
        @product = Product.new(product_params)
        if @product.save
            render json: @product, status: :created
        else
            render json: @product.errors, status: :unprocessable_entity
        end
    end
    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            render json: @product
        else
            render json: @product.errors, status: :unprocessable_entity
        end
    end
    def destroy
        @product = Product.find(params[:id])
        if @product.destroy
            render json: @product
        else
            render json: @product.errors, status: :unprocessable_entity
        end
      
    end
    private
    def product_params
        params.require(:product).permit(:name, :price, :description)
    end
    
end
