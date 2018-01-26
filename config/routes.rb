Rails.application.routes.draw do
	
  get 'page/index'
  get 'users/subs', to: 'users#subs'
  post 'unsub/:id', to: 'users#unsub', as: 'unsub'
  post 'sub/:id', to: 'users#sub', as: 'sub'

get 'signup', to: 'users#new', as: 'signup'
get 'login', to: 'sessions#index', as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'

	  resources :users
	  resources :images
  resources :sessions

  root 'sessions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
