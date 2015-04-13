Dish.destroy_all
Category.destroy_all
Client.destroy_all
Table.destroy_all
#init tables, categories and dishes for each restaurant
admin = Waiter.create :name => "master", :password => "bolaAzul", :admin => true
w1 = Waiter.create :name => "Joanna", :password => "abc"
w2 = Waiter.create :name => "Carol", :password => "asd"


w1.tables.create(:number =>1, :requested => false)
w1.tables.create(:number =>2, :requested => false)
w2.tables.create(:number =>3, :requested => false)

breakfast = Category.create :name => "Breakfast", :description => "The first meal of the day is the most important"
lunch = Category.create :name => "Lunch", :description => "The middle day meal"
dinner = Category.create :name => "Dinner", :description => "Last meal of the day"

breakfast.dishes.create(:title => "Toast", :description => "A toasted toast with cheese on it", :price => 3.5)
breakfast.dishes.create(:title => "Hot Chocolate", :description => "Start your day as sweet as you can!", :price => 1.75)
breakfast.dishes.create(:title => "Pancake", :description => "Try it with Nutella, you gonna love it", :price => 5.0)
breakfast.dishes.create(:title => "Cake", :description => "There is no such thing as diet...", :price => 3.80)

lunch.dishes.create(:title => "Meat", :description => "A tasteful stake", :price => 7.80)
lunch.dishes.create(:title => "Chicken", :description => "White meat", :price => 6.50)


dinner.dishes.create(:title=>"Hamburger", :description => "Meat, and Cheese", :price => 4.60)
dinner.dishes.create(:title=>"Pizza", :description => "Cheese and Pepperoni", :price => 8.63)
