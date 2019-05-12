Rails.application.routes.draw do
  get 'carts/:id/edit',                 to: 'carts#edit', as: 'cart_edit'
  get 'carts/:id/ship_to_another/edit', to: 'catrs#edit', as: 'ship_to_another_edit'
  get 'carts/:id/payment/edit',         to: 'catrs#edit', as: 'payment_edit'
  get 'carts/:id/confirm/edit',         to: 'catrs#edit', as: 'confirm_edit'

  resources :items do
    resource :item_carts,  only: [:create, :update]
    resource :item_singer, only: [:create]
    resource :review,      only: [:index, :new, :create, :update, :destroy]
  end

  resources :stock,            only: [:create, :update]
  resources :review,           only: [:index, :edit]
  resources :item_singer,      only: [:update]
  resources :item_genres,      only: [:create, :update]
  resources :genres,           only: [:index, :new, :edit, :create, :update, :destroy]
  resources :carts,            only: [:index, :new, :create, :update]
  resources :ship_to_anothers, only: [:create, :new, :update]

  resources :labels
  resources :contacts, only: [:new, :create]
end
