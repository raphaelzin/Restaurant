class WaitersController < ApplicationController
  def new
    @waiter = Waiter.new
  end

  def create
    @waiter = Waiter.new(waiter_params)
    
    if @waiter.save
      flash[:success] = 'Employer added'
      redirect_to waiters_employees_path
    end
  end

  def destroy
    @waiter = Waiter.find(params[:id])
    if @waiter.admin
      flash[:error] = 'Admin cannot be removed'
      redirect_to :back
    else
      @waiter.destroy
      flash[:success] = 'Employer removed'
      redirect_to :back
    end
  end

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

  def employees
    @waiter = Waiter.new

    if is_admin(current_waiter)
      @waiters = Waiter.all.order("id ASC")
    else  
      redirect_to root_path
    end
  end

  def manage_tables
    
    @waiters = Waiter.all
    @table = Table.new
    @tables = Table.all.order("id ASC")
  end

   def waiter_params
    params.require(:waiter).permit(:name, :password)
  end

end
