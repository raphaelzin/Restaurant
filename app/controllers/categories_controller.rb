class CategoriesController < ApplicationController
	def index
		@categories = Category.all.order('created_at ASC')
	end

	def show
		@category = Category.find(params[:id])
	end
end
