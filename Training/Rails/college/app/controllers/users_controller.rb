class UsersController < ApplicationController
    def show
        id = params[:id].to_i
        @user = User.find_by(id:id)
        if @user == nil
            
        else render 'users/show'
        end
    end
end