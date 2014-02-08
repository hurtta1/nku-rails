class CreateStudent < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :Name
      t.string :Nickname
      t.string :Email
      t.string :Gravitar
      t.string :password
      t.string :password_digest
      t.string :password_confirmation
      t.timestamps
    end
  end
end
