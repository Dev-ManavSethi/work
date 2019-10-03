class AdminsController < ApplicationController
    before_action :CheckAdminLoggedIn, only: [:index, :login, :verify]
    # before_action :CheckSuperAdminLoggedIn, only: [:create, :index, :edit, :update, :destroy]

    def index
    end

    def new
        @admin = Admin.new
    end

    def create

        admin_username = params[:admin][:admin_username]
        password = params[:admin][:password]
        secret_key = params[:secret]

        if secret_key == ""
            @admin = Admin.new(admin_username:admin_username, password:password)
            if @admin.save
                session[:admin_id] = @admin.id
                redirect_to '/admins/'  +  @admin.id.to_s
            else render :login
            end
        else render :login
        end
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
        admin_username = params[:admin][:admin_username]
        password = params[:admin][:password]

        @admin = Admin.find_by(admin_username:admin_username, password:password)

        if @admin==nil
            flash[:error].now = "Invalid login creds"
            render :login
        elsif @admin != nil
            session[:admin_id] = @admin.id
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