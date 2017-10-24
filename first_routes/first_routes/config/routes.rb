Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users


  # Comment out the resources :users line.
# Write out the eight routes using the route 'matching' syntax.
# For example: get 'users/:id', to: 'users#show', as: 'user'.

  # get 'users', to: 'users#index', as: 'users'
  # post 'users', to: 'users#create'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # post 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get 'users/:id', to: 'users#show', as: 'user'
  # patch 'users/:id', to: 'users#update', as: ''
  # put 'users/:id', to: 'users#update', as: ''
  # delete 'users/:id', to: 'users#destroy', as: ''
  resources :users, only: [:create, :destroy, :show, :update] do
    resources :artworks, only: [:index]
  end
  resources :artworks, only: [:create, :destroy, :show, :update]
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy, :index]

end
