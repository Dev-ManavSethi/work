class LogoutController < ApplicationController

    def logout
        id = params[:id].to_i
        @user = User.find(id)
        session[:user_id] = nil
        #refesh page
        redirect_back(fallback_location: root_path)
        #flash you are logged out now
        Sidekiq::Client.enqueue(EmailWorker, 3, @user.email, "College website Logout alert", "Login was successfull at college website. To login please click here: http://localhost:3000/login")
    end
end

