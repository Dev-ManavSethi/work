class SignupController < ApplicationController
    before_action :CheckUserLoggedIn
    def index
        @user = User.new
    end

    def signup
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
        image_file = params[:user][:image]
        accepted_tos = params[:user][:accepted_tos].to_i

        image_full_path = Rails.root.join('app','assets', 'images', 'users', image_file.original_filename)

        @user = User.new(name:name, email:email, password:password, gender:gender, phone:phone, address:address, city:city, state:state, country:country, date_of_birth:dob, accepted_tos:accepted_tos, image_path: image_full_path)

        if accepted_tos==1
          if @user.save
            @image = Image.new(image_path: image_full_path, image_profile_id: @user.id, image_profile_type:"user")

            if @image.save
                File.open(image_full_path, 'wb') do |server_image|
                    server_image.write(image_file.read)
                end
            end
              session[:user_id] = @user.id
              redirect_to user_path(@user)
          else render :index
          end    
        end

        if accepted_tos!=1
            @user.errors.add(:accepted_tos, " :Please select that you accept the Terms and Conditions")
            render :index
        end
    end
end

=begin
<% #f.label :password_confirmation, 'Confirm Password'%>
<% #f.password_field :password_confirmation%> s
=end