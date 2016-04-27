class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.text :instructions
      t.references :user

      t.timestamps null: false
    end
  end
end
