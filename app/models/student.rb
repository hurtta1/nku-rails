class Student < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  has_many :attendances
end
