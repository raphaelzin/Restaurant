Rails.application.routes.draw do

	get 'waiters/stats_admin'
  	get 'waiters/manage_tables'
	get 'waiters/manage_employees'
	get 'waiters/manage_categories'
	get 'waiters/manage_dishes'

	get 'extras/developer'
	get 'waiters/tables'
	get 'waiters/login'
	get 'waiters/admin'

	post 'tables/redirect_to_table' => 'tables#redirect_to_table'
	delete 'sign_out' => 'sessions#destroy'

	resources :tables do
		post :finish_table, on: :member
		post :toggle_request, on: :member
	  resources :clients do
	  	post :toggle_check_out, on: :member
	    post :toggle_done, on: :member
	    post :add_dish, on: :member
	  end
	end
resources :extras
resources :waiters
resources :sessions
resources :categories do
  resources :dishes
end

resources :orders do
  collection do
    get 'test'
  end
end

root 'tables#welcome'
get "*path" => redirect("/")
end
