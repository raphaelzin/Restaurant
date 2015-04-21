class TablesController < ApplicationController
	around_filter :catch_not_found

	def welcome
		#reset_session
	end

	def create
		@table = Table.new(table_params)
	    if @table.save
	      flash[:success] = 'Table successfully created!'
	      redirect_to :back
	    end
	end

	def show
		@table = Table.find(params[:id])
		if !current_waiter.present? && current_client.present? && current_client.table != @table 
			redirect_to table_clients_path(current_table,current_client)
		end
		@client = Client.new
	end

	def edit
		@table_edit = Table.find(params[:id])
	end

	def update
		@table = Table.find(params[:id])
	    if @table.update_attributes(table_params)
	    	@table.save
	    	flash[:success] = "Table successfully edited"
	    	redirect_to waiters_manage_tables_path
	    else
	    	render :edit
	    end
	end

	def redirect_to_table
		@table = Table.find_by(code: params[:code])
		redirect_to waiters_login_path
	end

	def toggle_request
		@table = Table.find(params[:table_id])
		@table.requested = !@table.requested
		@table.save
		redirect_to :back
	end

	def finish_table
		@table = Table.find(params[:table_id])
	  	@table.clients = []
	  	@table.save
	  	redirect_to waiters_tables_path
	end	

	def destroy
		@table = Table.find(params[:id])
		flash[:success] = 'Table successfully removed!'
		@table.destroy
		redirect_to :back
	end

	def catch_not_found
	  yield
	  rescue ActiveRecord::RecordNotFound
	  redirect_to root_url, :flash => { :error => "Record not found." }
  end

  def table_params
    params.require(:table).permit(:code, :number, :waiter_id)
  end
end
