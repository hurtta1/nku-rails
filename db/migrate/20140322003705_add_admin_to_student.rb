class AddAdminToStudent < ActiveRecord::Migration
  def change
    add_column :students, :isAdmin, :boolean
  end
end
