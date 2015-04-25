class WaitersController < ApplicationController
  def new
    @waiter = Waiter.new
  end

  def create
    @waiter = Waiter.new(waiter_params)
    
    if @waiter.save
      flash[:success] = 'Employer added'
      redirect_to waiters_manage_employees_path
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
    session[:client_id] = nil
  	@tables = Table.all.order("number ASC")
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

  def manage_employees
    if is_admin(current_waiter)
      redirect_to root_path
    end
    @waiter = Waiter.new
    if is_admin(current_waiter)
      @waiters = Waiter.all.order("id ASC")
    else  
      redirect_to root_path
    end
  end

  def manage_tables
    if !is_admin(current_waiter)
      redirect_to root_path
    end
    @waiters = Waiter.all
    @table = Table.new
    @tables = Table.all.order("id ASC")
  end

  def manage_categories

    if is_admin(current_waiter)
      @categories = Category.all.order("id ASC")
      @category = Category.new
    else  
      redirect_to root_path
    end
  end

  def manage_dishes
      if is_admin(current_waiter)
      @dishes = Dish.all.order("id ASC")
      @dish = Dish.new
      @category = Category.find_by(id: 1)
    else  
      redirect_to root_path
    end
  end

  def edit
    @waiter = Waiter.find(params[:id])
  end

  def update
    @waiter = Waiter.find(params[:id])
    if @waiter.update_attributes(waiter_params)
      @waiter.save
      flash[:success] = "Employee successfully edited"
      redirect_to waiters_manage_employees_path
    else
      render :edit
    end
  end

  def admin
    if !is_admin(current_waiter)
      redirect_to root_path
    end
  end

   def waiter_params
    params.require(:waiter).permit(:name, :password)
  end

end
