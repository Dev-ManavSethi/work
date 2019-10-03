class UserMailer < ApplicationMailer
    def welcome_email(email,subject ,message)
        @email=email
        @message = message
        mail(to: email, subject: subject)
    end

    def login_alert_email(email, subject, message)
        @email = email
        @message = message
        mail(to:email, subject: subject)
    end

    def user_delete_email(email, subject, message)
        @email = email
        @message = message
        mail(to: email, subject: subject)
    end
end
