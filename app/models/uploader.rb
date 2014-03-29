class Uploader < ActiveRecord::Base
  
  def initialize(file)
    @file = file
  end
  
  def upload
	  CSV.foreach(file.path, headers: true) do |row|
    @student= Student.find_by_email(:email)
    @assignment = student.assignments.find_by_name(row['assignment_name'])
    if !assignment.present?
      assignment_count += 1
      @assignment.total = row["total"]
      @assignment.score = row["score"]
      @assignment.save
    else !assignment.present?
      assignment_count += 1
      Assignment.create(student_id: @student.id,  assignment_name: row["assignment_name"], total: row["total"], score: row["score"])
    end
  end 
end