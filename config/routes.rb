Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  resources :posts
  resources :users

  get '/login', to: 'users#login'
  post '/login', to: 'users#login'

  get '/logout', to: 'users#logout'
  post '/logout', to: 'users#logout'
end
