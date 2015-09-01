Dish.destroy_all
Category.destroy_all
Client.destroy_all
Table.destroy_all
#init tables, categories and dishes for each restaurant
admin = Waiter.create :name => "Master", :password => "bolaAzul", :admin => true

