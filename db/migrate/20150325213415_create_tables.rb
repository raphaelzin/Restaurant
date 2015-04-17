class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :number
      t.string :code
			t.references :waiter
			t.boolean :requested
      t.timestamps null: false
    end
  end
end
