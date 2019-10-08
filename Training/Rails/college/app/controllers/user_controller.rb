class UserController < ApplicationController

    before_action :to_root, if: -> {user_signed_in?}
    protect_from_forgery with: :null_session

    def new
        @user = User.new
    end   

    def login
        @user = User.new
    end

    def upload_any_image
    end

    private
    def to_root
        redirect_to root_path
    end
end
