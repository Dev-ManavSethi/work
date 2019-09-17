class LogoutController < ApplicationController
    def confirm
        render 'logout/confirm'
    end

    def logout
        session[:user_id] = nil
        redirect_to root_path
        #try history
    end

    def cancel


    end
end

