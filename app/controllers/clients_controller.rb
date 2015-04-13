class ClientsController < ApplicationController
  around_filter :catch_not_found
  before_action :lookup_table
  
	def show
		@client = Client.find(params[:id])
    if @client.id != session[:client_id]  && !current_waiter.present?
      redirect_to root_path
    end
    session[:client_id] = @client.id
	end

  def new
    @client = @table.clients.new
  end

  def add_dish
    @client = Client.find(session[:client_id])
    @dish = Dish.find(params[:dish_id])
    @client.dishes << @dish
    @client.save
    redirect_to table_client_path(@client.table,@client)
  end

  def create
    @client = @table.clients.new(client_params)
    if @client.save
      session[:client_id] = @client.id
      redirect_to table_client_path(@client.table,@client)
    else
      render 'new'
    end
  end

  def select_client
    session[:client_id] = params[:id]
    redirect_to :back
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to waiters_tables_path
  end

  def catch_not_found
    yield
    rescue ActiveRecord::RecordNotFound
    redirect_to root_url, :flash => { :error => "Record not found." }
  end

  private

  def client_params
    params.require(:client).permit(:name,:done,:howManyTime,:table_id)
  end

  def lookup_table
    @table = Table.find(params[:table_id])
  end


end
