class AdminsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index   
        @admins = Admin.all
        render json: @admins
    end
    def show
        @admin = Admin.find(params[:id])
        render json: @admin
    end
    def create
        @admin = Admin.new(admin_params)
        if @admin.save
            render json: @admin, status: :created
        else
            render json: @admin.errors, status: :unprocessable_entity
        end
    end
    
    def update
        @admin = Admin.find(params[:id])
        if @admin.update(admin_params)
            render json: @admin
        else
            render json: @admin.errors, status: :unprocessable_entity
        end
    end

    def destroy

        @admin = Admin.find(params[:id])
        if @admin.destroy
            render json: @admin
        else
            render json: @admin.errors, status: :unprocessable_entity
        end
    end
    private
    def admin_params
        params.require(:admin).permit(:name, :email, :phone)
    end

end
