class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :title
      t.string :description
      t.float :price
      t.integer :howManyServe
      t.string :photo
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end