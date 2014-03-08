class Assignment < ActiveRecord::Base
  attr_accessible :score, :total
  def percentage
    (score / total.to_f) * 100
  end
end