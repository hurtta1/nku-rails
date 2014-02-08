class SessionsController < ApplicationController
  def new
  end
  
  def create
    student = Student.find_by_email(params[:Email])
    if student && student.authenticate(params[:password])
      session[:student_id] = student.id
      redirect_to show_student_path, :notice => "Welcome to your profile"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  session[:student_id] = nil
  redirect_to bueller_index_path, :notice => "logged out"
end
end
