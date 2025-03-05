class Admin::OrdersController < Admin::BaseController
    before_action :set_order, only: [:edit, :update, :destroy]
    def set_order
        @order = Order.find(params[:id]) # Ensure `id` is passed in params
      end
    def index
        @orders = Order.all
        # render json: @orders
    end
    def edit
    end
    def update  
        @order = Order.find(params[:id])
        if @order.update(order_params)
            flash[:notice] = "Order successfully updated!"
            redirect_to admin_orders_path
        else
            flash[:alert] = "Error updating order. Please check the form."
            render :edit, status: :unprocessable_entity
        end
    end
    def destroy
        @order = Order.find(params[:id])
        if @order.destroy
            flash[:notice] = "Order successfully deleted!"
            redirect_to admin_orders_path
        else
            flash[:alert] = "Error deleting order."
            render json: @order.errors, status: :unprocessable_entity
        end
    end
    private
    def order_params
        params.require(:order).permit(:status)
    end 


   
end
