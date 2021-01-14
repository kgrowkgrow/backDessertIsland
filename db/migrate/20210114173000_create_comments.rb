class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user_id, null: false, foreign_key: true
      t.references :recipe_id, null: false, foreign_key: true
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
