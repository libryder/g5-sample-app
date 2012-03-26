class UsersController < ApplicationController

  def index
    redirect_to root_path
  end

  # Action to activate user
  def activate

    @user = User.find(params[:id])
    
    if @user.pending_activation and not params[:activate].blank?

      if @user.activation_token == params[:activate]
        @user.update_attribute('pending_activation', false)
        cookies[:user] = { :value => @user.id, :expires => 1.year.from_now }
      else
        redirect_to root_path, notice: 'Incorrect activation token.'
        return
      end

    elsif not @user.pending_activation
    
      # If user has already activated their "account" then they should be
      # redirected to either an already-submitted tour or the new tour form
      @tour = Tour.find_by_user_id(@user.id)
      if @tour.nil?
        redirect_to new_tour_path, notice: 'Your account has already been activated.'
        return
      else
        redirect_to @tour, notice: 'Your account has already been activated.'
        return
      end

    end
    redirect_to edit_user_path
    
  end
  
  def create
  
    auth_token = SecureRandom.hex(16)
    
    @user = User.new(params[:user])

    if @user.save
      @user.update_attribute('ip', request.remote_ip)
      @user.update_attribute('activation_token', auth_token)

      #send auth email
      host = request.host_with_port
      activation_url = "http://#{host}/activate/#{@user.id}/#{auth_token}"
      TourMailer.activation(@user, activation_url).deliver
    else
      render action: "new"
    end
    
  end

  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to new_tour_path
    else
      render action: "edit" 
    end
  end

end
