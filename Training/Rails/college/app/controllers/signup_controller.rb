class SignupController < ApplicationController
    before_action :UserLoggedIn
    def index
        @uli = self.UserLoggedIn
        @user = User.new
        render 'signup/index'
    end

    def create
        name = params[:user][:name]
        email = params[:user][:email]
        password = params[:user][:password]
        #do pass confirmation
        phone = params[:user][:phone].to_i
        address = params[:user][:address]
        city = params[:user][:city]
        state = params[:user][:state]
        country = params[:user][:country]
        dob = params[:user][:date_of_birth]
        gender = params[:user][:gender]
        #get image
        accepted_tos = params[:user][:accepted_tos].to_i

        @user = User.new(name:name,email:email, password:password, gender:gender, phone:phone, address:address, city:city, state:state, country:country, date_of_birth:dob, accepted_tos:accepted_tos) #do image path

        if accepted_tos==1
          if @user.save
              session[:user_id] = @user.id
              redirect_to user_path(@user)
          else render :index
          end    
        end

        if accepted_tos!=1
            @user.errors.add(:accepted_tos, " :Please select that you accept Terms and conditions")
            render :index
        end
    end
end
=begin
<% #f.label :photo, 'Upload Photo'%>
  <% #f.file_field :photo, accept: 'image/png,image/jpeg,image/jpg'%>

   <% #f.label :password_confirmation, 'Confirm Password'%>
  <% #f.password_field :password_confirmation%> s
=end