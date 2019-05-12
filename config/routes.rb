Rails.application.routes.draw do
  get 'carts/index'
  get 'carts/new'
  get 'carts/edit'
  get 'carts/create'
  get 'carts/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :genres, only: [:index, :new, :edit, :create, :update, :destroy]
  
end
