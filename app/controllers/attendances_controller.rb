class AttendancesController < ApplicationController
  def index
    @attendances = Attendance.all
  end
  def new 
    @attendances = Attendances.new
  end
  
  def create
    @attendances = Attendances.new(params[:student].permit(:attendance, attended_on: now, seat: 1))
  end
end
