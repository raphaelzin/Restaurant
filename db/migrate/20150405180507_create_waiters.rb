class CreateWaiters < ActiveRecord::Migration
  def change
    create_table :waiters do |t|
    	t.string :name
    	t.string :last_name

    	t.boolean :admin, default: false
      t.string :password_digest, null: false
      
      t.timestamps null: false
    end
  end
end
