class UserController < ApplicationController

    def new
        @user = User.new
    end   

    def login
        @user = User.new
    end
end
