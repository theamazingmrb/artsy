Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :posts do
  resources :comments
end
root 'users#new'

  get 'users/new' => 'users#new', as: :new_user # form for sign up
  get 'users' => 'users#index', as: :home
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show', as: :user

  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # get "posts/" => "posts#index"
  # get "posts/new" => "posts#new", as: :new_post
  # post "posts/" => "posts#create"
  # get "posts/:id" => "posts#show", as: :post
  # get "posts/:id/edit" => "posts#edit", as: :edit_post
  # patch "posts/:id" => "posts#update"
  # delete "posts/:id" => "posts#destroy"

end
