class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :user_location
      t.boolean :admin?, default: false
      t.string :email, unique: true
      t.string :password_digest
      t.string :remember_digest


      t.timestamps null: false
    end
  end
end
