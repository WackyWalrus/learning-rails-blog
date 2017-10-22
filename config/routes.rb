Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  resources :posts do
  	resources :comments
  end
  resources :users

  get '/login', to: 'users#login'
  post '/login', to: 'users#login'

  post '/logout', to: 'users#logout'
end
