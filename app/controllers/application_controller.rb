class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  helper_method :current_client, :current_table, :sign_in_waiter, :current_waiter, :is_admin?

  def current_client
    if session.key?(:client_id)
      Client.find(session[:client_id])
    else
      nil
    end
  end

  def current_table
  	current_client.table
  end

  def current_waiter
    if session.key?(:waiter_id)
      Waiter.find(session[:waiter_id])
    else
      nil
    end
  end

  def sign_in_waiter(user)
    session[:waiter_id] = user.id
  end
  
  def is_admin?
    if current_waiter.present?
      current_waiter.admin
    end
  end

end
