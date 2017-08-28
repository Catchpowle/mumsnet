Rails.application.routes.draw do
  root to: 'categories#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :categories
  resources :products, except: %i[index]
end
