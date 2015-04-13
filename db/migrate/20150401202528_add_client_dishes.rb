class AddClientDishes < ActiveRecord::Migration
  def change
  	create_table :clients_dishes do |t|
		  t.belongs_to :client, index: true
		  t.belongs_to :dish, index: true
		end
  end
end
