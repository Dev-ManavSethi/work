class LogoutController < ApplicationController

    def logout
        session[:user_id] = nil
        #refesh page
        redirect_back(fallback_location: root_path)
        #flash you are logged out now
    end
end

