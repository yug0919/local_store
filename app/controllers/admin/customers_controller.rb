class Admin::CustomersController < Admin::BaseController



    def index
        if params[:search].present?
            @customers = Customer.where("name ILIKE ? OR email ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
          else
            @customers = Customer.all
          end
                    end
    def show
        @customer = Customer.find(params[:id])
        render layout: false # This will disable the layout for the show action

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
             redirect_to admin_customers_path, notice: "Customer updated successfully."
        else
            redirect_to admin_customers_path, notice: "Error while update."
        end
    end
    def destroy
        @customer = Customer.find(params[:id])
        if @customer.destroy
            redirect_to admin_customers_path, notice: "Customer Delete Succesfully."
        else
            render json: @customer.errors, status: :unprocessable_entity
        end
    end
    
    private
  
    def customer_params
        params.require(:customer).permit(:name, :email, :phone, :address, :balance, :password, :password_confirmation)
      end
end
