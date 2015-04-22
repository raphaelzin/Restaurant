class CategoriesController < ApplicationController
	def index
		@categories = Category.all.order('created_at ASC')
	end

	def show
		@category = Category.find(params[:id])
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		flash[:success] = "Category successfully deleted"
		redirect_to :back
	end

	def edit
		@category = Category.find(params[:id])
	end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      @category.save
      flash[:success] = "Category successfully edited"
      redirect_to waiters_manage_categories_path
    else
      render :edit
    end
  end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Category successfully created"
			redirect_to waiters_manage_categories_path
		else
			flash[:success] = "Category could not be created"
			redirect_to :back
		end
	end

	def category_params
		params.require(:category).permit(:name, :description)
	end
end
