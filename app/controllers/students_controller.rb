class StudentsController < ApplicationController
  
  def new 
    @student = Student.new
  end
  
  def create
    @student = Student.new(params[:student].permit(:name, :nickname, :email, :gravitar, :password, :password_confirmation))
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
    if current_student == @student
      render :edit
    else 
      redirect_to bueller_index_path
    end
      
  end
  
  def update
    @student = Student.find(params[:id])
    #return false unless @student == current_student
    if @student.update(params[:student].permit(:name, :nickname, :email, :gravitar, :password, :password_confirmation))
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
    params.require(:student).permit(:name, :nickname, :email, :gravitar, :password, :password_confirmation)
  end
end