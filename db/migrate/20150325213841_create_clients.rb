class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.boolean :done, default: false
      t.string :payment_method 
      t.integer :howManyTime
      t.references :table, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
