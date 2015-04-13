class WaitersController < ApplicationController
  def tables
  	if !current_waiter.present?
  		redirect_to root_path
  	end
  	@tables = Table.all.order("id ASC")
  end

  def login
  	reset_session
  end

  def show
  	@waiter = Waiter.find(params[:id])
  end

  def finish_table
  	@table = Table.new(params[:table_id])
  	redirect_to waiters_tables
  end
end
