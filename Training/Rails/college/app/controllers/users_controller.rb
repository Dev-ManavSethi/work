class UsersController < ApplicationController
    def show
        id = params[:id].to_i
        @user = User.find(id)
        if @user == nil
            
        else render 'users/show'
        end
    end

    def update
        id = params[:id].to_i
        @user = User.find(id)

        if @user.update(get_user_params)
            redirect_to user_path(@user)
            Sidekiq::Client.enqueue(EmailWorker, 4, @user.email, "Account updated at college website",  "As per your request, your account is now updated.")
        else redirect_to user_path(@user)
        end
    end



    def destroy
        id = params[:id]
        @user = User.find(id)
        if @user == nil
        elsif @user!=nil
            if @user.destroy
                session[:user_id] = nil
                redirect_to root_path
                #flash : Account deleted
                Sidekiq::Client.enqueue(EmailWorker, 5, @user.email, "Account deleted at college website",  "As per your request, your account is now deleted.")
                # EmailWorker.perform_async(4, @user.email, "Account deleted at college website", "As per your request, your account is now deleted.")
            else
            end
        end
    end

    private
    def get_user_params
        params.require(:user).permit(:name, :email, :password, :phone, :gender, :address, :date_of_birth, :image_path, :city, :state, :country, :accepted_tos)
    end
end