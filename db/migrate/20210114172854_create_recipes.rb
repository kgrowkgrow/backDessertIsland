class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.integer :net_carbs
      t.integer :calories
      t.string :image_url
      t.string :instructions
      t.integer :serving_size
      t.integer :ready_in_minutes
      t.string :summary

      t.timestamps
    end
  end
end
