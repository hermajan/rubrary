Rails.application.routes.draw do
	devise_for :users
	resources :authors
	resources :books
	resources :reservations

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'library#index'
end
