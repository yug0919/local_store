class Admin::ProductsController < Admin::BaseController

    def index
        @products = Product.all
    end
    def show
        @product = Product.find(params[:id])
        render json: @product
    end
    def create
        @product = Product.new(product_params)
        if @product.save
          redirect_to admin_products_path, notice: "Product successfully created."
        else
          render :new, alert: "Error creating product."
        end
    end
    def new
        @product = Product.new
    end
    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to admin_products_path, notice: "Product successfully Updated."
        else
              render :edit, alert: "Error updating product."
        end
    end
    def destroy
        @product = Product.find(params[:id])
        if @product.destroy
             redirect_to admin_products_path, notice: "Product successfully Deleted."
        else
            render json: @product.errors, status: :unprocessable_entity
        end
    end
    private
    def product_params
        params.require(:product).permit(:name, :price, :description,:image_url)
    end

end
