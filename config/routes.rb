Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'users#new'

  get 'users/new' => 'users#new', as: :new_user # form for sign up
  get 'users' => 'users#index', as: :home
  post 'users' => 'users#create'
  get 'user/:id' => 'user#show', as: :user

  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
