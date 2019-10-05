class UserController < ApplicationController

    before_action :to_root, if: -> {user_signed_in?}

    def new
        @user = User.new
    end   

    def login
        @user = User.new
    end

    private
    def to_root
        redirect_to root_path
    end
end
