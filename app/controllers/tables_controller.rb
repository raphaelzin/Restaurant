class TablesController < ApplicationController
	around_filter :catch_not_found

	def welcome
		#reset_session
	end

	def show
		@table = Table.find(params[:id])
		if current_client.present? && current_client.table != @table
			redirect_to table_clients_path(current_table,current_client)
		end
		@client = Client.new
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

	def catch_not_found
	  yield
	  rescue ActiveRecord::RecordNotFound
	  redirect_to root_url, :flash => { :error => "Record not found." }
  end
end
