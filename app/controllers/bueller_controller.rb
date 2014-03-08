class BuellerController < ApplicationController
  def index
    @bueller = Student.all
    if !@current_student
    redirect_to new_session_path
    end
  end
end