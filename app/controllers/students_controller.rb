class StudentsController < ApplicationController
  skip_before_filter :require_authentication, only: [:new, :create]
  
  def new 
    @student = Student.new
  end
  
  def create
    @student = Student.new(params[:student].permit(:name, :nickname, :email, :gravitar, :password, :password_confirmation))
    if @student.save
      session[:student_id] = @student.id
      redirect_to students_path
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
    return false unless @student == current_student
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
  
  def self.in_seat(seat, now=Date.today)
    present(now).where('attendances.seat = ?', seat)
  end

  def self.absent(now=Date.today)
    where.not(id: present(now))
  end

  def self.present(now=Date.today)
  joins(:attendances).where(attendances: {attended_on: now})
  end
 private  
  def student_params
    params.require(:student).permit(:name, :nickname, :email, :gravitar, :password, :password_confirmation)
  end
end