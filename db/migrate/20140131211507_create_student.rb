class CreateStudent < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :Name
      t.string :Nickname
      t.string :Email
      t.string :Gravitar
      t.string :password
      t.string :confirm
      t.timestamps
    end
  end
end
