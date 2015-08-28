class OrdersController < ApplicationController
	# def test
	#   some_parameter = params[:some_parameter]
	#   # do something with some_parameter and return the results
	#   @orders = Order.last
	#   @test = Order.last
	#   respond_to do |format|
	#     format.html
	#     format.json {render json: @test}
	#   end
	# end 
  def self.total_on(date)
      where("date(purchased_at) = ?",date).sum(:total_price)  
  end
end
