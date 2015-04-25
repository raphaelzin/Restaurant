class DishesController < ApplicationController
	before_action :lookup_category

	def show
		@dish = Dish.find(params[:id])
	end
	
	def create
    @dish = @category.dishes.new(dish_params)
    if @dish.save
    	flash[:success] = "Dish successfully created"
      redirect_to waiters_manage_dishes_path
    else
      render 'new'
    end
  end

  def edit
  	@dish = Dish.find(params[:id])
  	@category = Category.find_by(id: 1)
  end

  def update
  	@dish = Dish.find(params[:id])
    if @dish.update_attributes(dish_params)
      @dish.save
      flash[:success] = "Dish successfully edited"
      redirect_to waiters_manage_dishes_path
    else
      render :edit
    end
  end

	def dish_params
	  params.require(:dish).permit(:title,:description,:price,:howManyServe,:pic,:category_id)
	end

	def lookup_category
	  @category = Category.find(params[:category_id])
	end

  def destroy
    @dish = Dish.find(params[:id])
    flash[:success] = 'Dish successfully removed!'
    @dish.destroy
    redirect_to :back
  end
end
