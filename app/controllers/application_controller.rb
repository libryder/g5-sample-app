class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_user
  
  def check_user
    if cookies[:user].blank?
      @existing_user = false
    else
      @existing_user = true
      @user_id = cookies[:user]
    end
  end
end
