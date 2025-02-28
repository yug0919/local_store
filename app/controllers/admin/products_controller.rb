class Admin::ProductsController < ApplicationController
    before_action :require_admin
    before_action:authenticate_admin!

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
    def require_admin
        if !current_admin
            render json: {error: "You must be an admin to access this page"}, status: :unauthorized
        end
    end
end
