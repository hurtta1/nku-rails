class TeachersController < ApplicationController
  def index
    @teacher = Student.all
  end
end