class DishesController < ApplicationController
	before_action :lookup_category

	def show
		@dish = Dish.find(params[:id])
	end

	def new
		@dish = @category.dishes.new
	end
	
	def create
    @dish = @category.dishs.new(dish_params)
    if @dish.save
      redirect_to root_path, notice: 'Created!'
    else
      render 'new'
    end
  end

	def dish_params
	  params.require(:dish).permit(:title,:description,:price,:howManyServe,:photo,:category_id)
	end

	def lookup_category
	  @category = Category.find(params[:category_id])
	end
end
