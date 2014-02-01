class StudentsController < ApplicationController
  
http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  
  def new 
    @student = Student.new
  end
  
  def create
    @student = Student.new(params[:student].permit(:Name, :Nickname, :Email, :Gravitar))
    if @student.save
      redirect_to students_path
    else
      render 'new'
    end
  end
  
  def show
    @student = Student.find(params[:id])
  end
  
  def index
    @student = Student.all
  end
  
  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update(params[:student].permit(:Name, :Nickname, :Email, :Gravitar))
      redirect_to students_path, :flash => {:notice => 'You have succesfully updated your account'}
    else
      render 'edit'
    end
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end
 private  
  def student_params
    params.require(:student).permit(:Name, :Nickname, :Email, :Gravitar)
  end
end