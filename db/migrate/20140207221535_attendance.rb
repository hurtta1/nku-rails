class Attendance < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :attendances
      t.string :attended_on
      t.integer :seat
      y.integer :count
    end
  end
end
