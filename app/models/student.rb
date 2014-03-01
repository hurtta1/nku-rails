class Student < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation
  validates_presence_of :password, :on => :create
  has_many :attendances
  
  def self.in_seat(seat, date)
    Student.joins(:attendances).where(attendances: {seat: seat, attended_on: date})
  end

  def self.absent(date)
    Student.joins(:attendances).where.not(attendances: {attended_on: date})
  end
  
  def self.present(now=Date.today)
    joins(:attendances).where(attendances: {attended_on: now})
  end
end
