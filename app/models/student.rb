class Student < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation
  validates_presence_of :password, :on => :create
  has_many :attendances
end
