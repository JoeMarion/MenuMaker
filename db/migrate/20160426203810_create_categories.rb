class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :section, default: "Misc"
      t.references :user
      t.timestamps null: false
    end
  end
end
