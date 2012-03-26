class ToursController < ApplicationController
  # GET /tours
  # GET /tours.json
  def index
    redirect_to root_path
  end

  def show
    @tour = Tour.find(params[:id], :include => :user)
  end

  def new
    if @existing_user and cookies[:user]
      @user = User.find_by_id(cookies[:user])

      # This condition was created for testing purposes. db:reset unfortunately 
      # didn't clear the current cookie and this was easier than manually removing
      # the cookie. Safe to remove for production.  
      if @user.nil?
        cookies.delete :user
        redirect_to new_user_path
        return
      # user hasn't entered additional information and is attempting to create a new
      # tour without it
      elsif @user.first_name.nil?
        redirect_to edit_user_path @user
        return
      end

      @amenities = ["pool", "rec room", "movie theater", "on site doctor", "time machine"]

      @tour = Tour.new
      @tour.user = @user
    else
      redirect_to new_user_path
      return
    end

  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def create
    @tour = Tour.new(params[:tour])
    @tour.user_id = @user_id
        
    if @tour.save
      TourMailer.request_tour(@tour).deliver
      TourMailer.tour_confirmation(@tour).deliver
      redirect_to @tour, notice: 'Tour was successfully created.'
    else
      render action: "new"
    end

  end

  def update
    @tour = Tour.find(params[:id])

    if @tour.update_attributes(params[:tour])
      redirect_to @tour, notice: 'Tour was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy
  end
end
