# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  

  def CheckUserLoggedIn
    if session[:user_id]==nil
      if request.path == login_path

      elsif request.path == signup_path

      else
        flash[:error] = "Please Login First" #not working
        redirect_to login_path
      end
    elsif session[:user_id]!=nil
      #redirect_to last page
      flash[:error] = "You are already logged in please logout first" #not working
      redirect_back(fallback_location: root_path)
    end   
  end

  def CheckAdminLoggedIn
    if session[:admin_id]==nil
      if request.path == admins_login_path

      else
        flash[:error] = "Please Login First as Admin!" #not working
        redirect_to admins_login_path
      end
    elsif session[:admin_id]!=nil
      #redirect_to last page
      flash[:error] = "You are already logged in as Admin please logout first!" #not working
      redirect_back(fallback_location: root_path)
    end

  end




  #define error responses on invalid requests
  def error
    render status_code.to_s, status: (params[:code] || 500)
  end
end
