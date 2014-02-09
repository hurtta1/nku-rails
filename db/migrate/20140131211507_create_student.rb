class CreateStudent < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :nickname
      t.string :email
      t.string :gravitar
      t.string :password
      t.string :password_digest
      t.string :password_confirmation
      t.timestamps
    end
  end
end
