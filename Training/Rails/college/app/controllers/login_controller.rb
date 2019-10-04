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
            Sidekiq::Client.enqueue(EmailWorker, 2, @user.email, "College website Login alert", "We noticed a login in your account at our website. If it wasn't you, please click here: http://localhost:3000/login/abuse")
            # EmailWorker.perform_async(2, @user.email, "College website Login alert", "We noticed a login in your account at our website. If it wasn't you, please click here: http://localhost:3000/login/abuse")
        end
    end
end
