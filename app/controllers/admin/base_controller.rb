class Admin::BaseController < ApplicationController
    layout 'admin'
    before_action :require_admin
    before_action :authenticate_admin!
    
    private

    def require_admin
        if !current_admin
            render json: {error: "You must be an admin to access this page"}, status: :unauthorized
        end
    end
end
