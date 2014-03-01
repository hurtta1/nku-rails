class Attendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.datetime :attended_on
      t.integer :seat
      t.integer :student_id
      t.timestamps
    end
  end
end
