class ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @products = Product.all
        # render json: @products
    end
    def show
        @product = Product.find(params[:id])
        render json: @product
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
