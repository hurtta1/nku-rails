class AddNameAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :assignment_name, :string
  end
end
