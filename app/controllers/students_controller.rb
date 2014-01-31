class StudentsController < ApplicationController
  
http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  
  def new 
    @student = Student.new
  end
  
  def create
    @student = Student.new(params[:student].permit(:Name))
    if @student.save
      redirect_to @student
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
    if @student.update(params[:student].permit(:Name))
      redirect_to @student
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
    params.require(:student).permit(:Name)
  end
end