class AddOrderDishes < ActiveRecord::Migration
  def change
  	create_table :dishes_orders do |t|
		  t.belongs_to :dish, index: true
		  t.belongs_to :order, index: true
		end
  end
end
