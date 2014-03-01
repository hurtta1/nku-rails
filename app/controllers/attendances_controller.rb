class AttendancesController < ApplicationController
  
  def index
    # Check if a student is specified
    if( params[:student_id] )
      # Get all of this student's attendances
      @selected_student = Student.find( params[:student_id] )
      @attendances = Attendance.where( student: @selected_student )
    else
      # Show all attendances
      @attendances = Attendance.all
    end
  end
  
  def new
    # Make sure they're logged in
    @current_student = current_student
    
    if !@current_student
      redirect_to new_session_path
    end
    
    @attendance = Attendance.new
  end
  
  def create
    @attendances = Attendance.all
    @attendances.each do |attendance|
      if attendance.student_id == current_student.id && attendance.attended_on == Date.today
        redirect_to attendances_path, :notice => "You have already logged your attendance for today."
        return
      end
    end
    @attendance = Attendance.new
    @attendance.attended_on = Date.today
    @attendance.seat = params[:seat]
    @attendance.student_id = current_student.id
      
    if @attendance.save
      redirect_to attendances_path, :notice => "Attendance recorded"
    else
      flash[:notice] = "You must submit a seat number."
      render 'new'
    end 
  end

  private
  def attendance_params
    params.permit(:attended_on, :seat, :student_id)
  end 
end