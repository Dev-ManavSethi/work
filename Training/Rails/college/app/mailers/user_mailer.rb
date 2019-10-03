class UserMailer < ApplicationMailer
    def welcome_email
        @user = params[:user]
        @url = 'http://localhost:3000/login'
        mail(to: @user.email, subject: 'Welcome aboard')
    end
end
