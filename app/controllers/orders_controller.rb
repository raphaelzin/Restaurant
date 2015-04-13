class OrdersController < ApplicationController
	def new
		@order = Order.new
	end

	def create
		@order = Pledge.new(order_params)

    if @order.save
      redirect_to project_path(@project), notice: 'Created a pledge!!'
    else
      render 'new'
    end
	end

	def order_params
    params.require(:order).permit(:total,:client_id)
  end

end
