class SessionsController < ApplicationController
  def new
  end
  
  def create
    student = Student.find_by_email(params[:email])
    if student && student.authenticate(params[:password])
      session[:student_id] = student.id
      redirect_to students_path, :notice => "Log in successful!"
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
