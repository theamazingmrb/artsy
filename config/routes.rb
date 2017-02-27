Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'user' => 'user#index'
get 'user/new' => 'user#new', as: :new_user
pose 'user' => 'users#create'
end
