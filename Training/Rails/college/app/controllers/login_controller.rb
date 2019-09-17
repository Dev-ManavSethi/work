class LoginController < ApplicationController
    #before_action :UserLoggedIn
    def index
        @uli = self.UserLoggedIn
          @user = User.new
          render 'login/index'
    end

    def verify
        email = params[:user][:email]
        password = params[:user][:password]

        @user = User.find_by(email:email, password:password)
        if @user == nil
            render :index
        else session[:user_id]=@user.id
            redirect_to user_path(@user)
        end
    end
end
