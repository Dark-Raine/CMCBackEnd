Rails.application.routes.draw do
  resources :reviews
  resources :children
  # resources :users
  resources :childminders

  post '/users/register', to: 'users#register'
  post '/users/login', to: 'users#login'
  get '/users/authenticate', to: 'users#authenticate'
  get '/users/mydata', to: 'users#mydata'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
