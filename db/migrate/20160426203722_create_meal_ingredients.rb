class CreateMealIngredients < ActiveRecord::Migration
  def change
    create_table :meal_ingredients do |t|
      t.references :meal
      t.references :ingredient
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
