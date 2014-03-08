class TeachersController < ApplicationController
  def index
    @teacher = Student.all
    if !@current_student
      redirect_to new_session_path
    end
  end
end