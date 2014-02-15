class AttendanceController < ApplicationController
  def create
    @attendance = Attendance.find(params[:student_id])
    @student = @attendance.attendance.create(params[:attendance])
  end
end
