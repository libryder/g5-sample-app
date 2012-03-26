class TourMailer < ActionMailer::Base
  default from: "g5@example.com"
  
  def activation(user, url)
    @user = user
    @url = url
    mail(:to => @user.email, :subject => "Please activate your account.")
  end
  
  def request_tour(tour)
    @tour = tour
    mail(:to => "tours@example.com", :subject => "New tour requested.")
  end
  
  def tour_confirmation(tour)
    @tour = tour
    mail(:to => @tour.user.email, :subject => "Tour request confirmation.")
  end
end
