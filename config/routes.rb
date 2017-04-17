Rails.application.routes.draw do

  	root 'welcome#index'

  	get 'signup', to: 'users#new', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	delete 'logout', to: 'sessions#destroy', as: 'logout'

	get "/auth/:provider/callback" => "sessions#create_from_omniauth"
	get   '/login', :to => 'sessions#new', :as => :log_in
	get '/auth/failure', :to => 'sessions#failure'
	get '/logout', :to => 'sessions#destroy'

  	resources 'users'
  	resources :sessions, only: :create
end
