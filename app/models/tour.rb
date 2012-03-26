class Tour < ActiveRecord::Base
  belongs_to :user
  serialize :amenities
  
  attr_accessible :tour_date, :additional_questions, :rating, :amenities
end
