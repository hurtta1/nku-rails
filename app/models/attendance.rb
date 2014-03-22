class Attendance < ActiveRecord::Base
  attr_accessible :seat
  
  belongs_to :student
  validates :seat, :inclusion => { :in => 1..4, 
    :message => "Not a valid seat"}
end
