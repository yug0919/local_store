class Admin::CustomersController < ApplicationController
    before_action :require_admin
    before_action :authenticate_admin!


    def index
        @customers = Customer.all
        # render json: @customers
    end
    def show
        @customer = Customer.find(params[:id])
        render json: @customer
    end
    def new
        @customer = Customer.new
    end
    
    def create
        @customer = Customer.new(customer_params)
        if @customer.save
            flash[:notice] = "Customer successfully created!"
          redirect_to admin_customers_path, notice: "Customer created successfully."
        else
            flash[:alert] = "Error creating customer. Please check the form."
          render :new, status: :unprocessable_entity
        end
      end
    def edit
        @customer = Customer.find(params[:id])
    end
    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
            render json: @customer
        else
            render json: @customer.errors, status: :unprocessable_entity
        end
    end
    def destroy
        @customer = Customer.find(params[:id])
        if @customer.destroy
            render json: @customer
        else
            render json: @customer.errors, status: :unprocessable_entity
        end
    end
    
    private
  
    def customer_params
        params.require(:customer).permit(:name, :email, :phone, :address, :balance, :password, :password_confirmation)
      end
    def require_admin
        if !current_admin
            render json: {error: "You must be an admin to access this page"}, status: :unauthorized
        end
    end
end
