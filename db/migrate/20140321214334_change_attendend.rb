class ChangeAttendend < ActiveRecord::Migration
  def change
    change_column(:attendances, :attended_on, :date)
  end
end
