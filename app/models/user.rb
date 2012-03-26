class User < ActiveRecord::Base
  has_one :tour
  
  validates_presence_of :email
  validates :first_name, :last_name, :phone_number, :presence => true, :on => :update
  
  validates_uniqueness_of :email
  attr_accessible :email, :first_name, :last_name, :phone_number
  
end
