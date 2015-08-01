Rails.application.routes.draw do
  resources :posts do 
  	resources :comments
  end

  resources :sessions, only: [:new, :create, :destroy]

  root to: "posts#index"

  match 'signin', to: 'sessions#new', via: 'get'
  match 'signout', to: 'sessions#destroy', via: 'delete'
<<<<<<< HEAD

=======
>>>>>>> 38396a90dc3d58d5a9776e8678d948406393b43a
end
