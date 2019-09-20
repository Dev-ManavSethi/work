class LoginController < ApplicationController
    before_action :CheckUserLoggedIn

    def index
          @user = User.new
    end

    def verify
        email = params[:user][:email]
        password = params[:user][:password]

        @user = User.find_by(email:email, password:password)
        
        if @user == nil
            flash.now[:error] = "Invalid login credentials" #not working
            render :index
        else session[:user_id]=@user.id
            redirect_to user_path(@user)
        end
    end
end
