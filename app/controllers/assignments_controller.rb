class AssignmentsController < ApplicationController
  
  def index
    if current_student.isAdmin?
      if params[:Student_id].present?
        @assignment = Student.find(params[:student_id]).assignment
      else
        @assignment = Assignment.all
      end
    end
  end
  
  def new
    @assignment = Assignment.new
  end
  
  def create
    @assignment = Assignment.new(assignment_params)
    
    if @assignment.save
      redirect_to students_path, notice: "Assignment created."
    else
      render 'new'
    end
  end
  
  private
    def assignment_params
      params.require(:assignment).permit(:student_id, :assignment_name, :score, :total)
    end
end