class AdminsController < ApplicationController
    before_action :CheckAdminLoggedIn, only: [:index, :login, :verify]

    def index
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def login
        @admin = Admin.new
    end

    def verify
        admin_username = params[:admin_username]
        password = params[:password]

        @admin = Admin.find_by(admin_username:admin_username, password:password)

        if @admin==nil
            flash[:error].now = "Invalid login creds"
            render :login
        elsif @admin != nil
            redirect_to admin_path(@admin)
        end

    end

    def logout
        if session[:admin_id]==nil
            #flash you are already logged out as admin
            #redirect back
        elsif session[:admin_id] != nil
            session[:admin_id] = nil
            #flash "You are successfully logged out as admin"
            #redirect back
        end 
    end
end