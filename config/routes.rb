Rails.application.routes.draw do

  	get 'waiters/manage_tables'
	get 'waiters/manage_employees'
	get 'waiters/manage_categories'
	get 'waiters/manage_dishes'

	get 'waiters/tables'
	get 'waiters/login'
	get 'waiters/admin'

	delete 'sign_out' => 'sessions#destroy'

	resources :tables do
		
		post :finish_table, on: :member
		post :toggle_request, on: :member
	  resources :clients do
	    post :select_client, on: :member
	    post :add_dish, on: :member
	  end
	end

resources :waiters
resources :sessions
resources :categories do
  resources :dishes
end

root 'tables#welcome'
get "*path" => redirect("/")
end
