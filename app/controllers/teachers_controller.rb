class TeachersController < ApplicationController
    skip_before_filter :require_authentication
  
  def index
    @teacher = Student.all
  end
end