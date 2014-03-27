class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.date :dob
      t.integer :zipcode
      t.boolean :admin
      t.string :password_digest
    end
  end
end
