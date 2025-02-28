class Admin::OrdersController < ApplicationController
    before_action :require_admin
    before_action :authenticate_admin!

    def index
        @orders = Order.all
        # render json: @orders
    end
    private
    def require_admin
        if !current_admin
            render json: {error: "You must be an admin to access this page"}, status: :unauthorized
        end
    end
end
