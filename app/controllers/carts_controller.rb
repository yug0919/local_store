class CartsController < ApplicationController
    
    def index
        @carts = Cart.all
        render json: @carts
    end
    def show    
        @cart = Cart.find(params[:id])
        render json: @cart
    end
    def create
        @cart = Cart.new(cart_params)
        if @cart.save
            render json: @cart, status: :created
        else
            render json: @cart.errors, status: :unprocessable_entity
        end
    end
    def update
        @cart = Cart.find(params[:id])
        if @cart.update(cart_params)
            render json: @cart
        else
            render json: @cart.errors, status: :unprocessable_entity
        end
    end
    def destroy
        @cart = Cart.find(params[:id])
        @cart.destroy
    end
    private
    def cart_params
        params.require(:cart).permit(:customer_id)
    end
    
    
end
