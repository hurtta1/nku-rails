class Assignment < ActiveRecord::Base
  attr_accessible :assignment_name, :score, :total
  belongs_to :student
  
  def percentage
    percent = (score.to_f / total.to_f) * 100.00
    percent = percent.round(2) 
    return percent
  end
  
  def average_percentage
    s1 = all.sum(:score)
    s2 = all.sum(:total)
    avg = (s1 / s2) * 100
    return avg
  end
  
end