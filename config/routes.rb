Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    }
  root :to => "items#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :singers

  resources :users, only: [:show] do
    resource :favorites, only: [:index]
  end

  get 'carts/:id/edit',                 to: 'carts#edit', as: 'cart_edit'
  post 'carts/:id/edit',                to: 'carts#cartedit', as: 'cart_cartedit'
  get 'carts/:id/ship_to_another/edit', to: 'carts#ship', as: 'ship_to_another_edit'
  post 'carts/:id/ship_to_another/edit', to: 'carts#shipedit', as: 'ship_to_another_shipedit'
  get 'carts/:id/payment/edit',         to: 'carts#pay', as: 'payment_edit'
  get 'carts/:id/confirm/edit',         to: 'carts#edit', as: 'confirm_edit'

  resources :items do
    resource :item_carts,  only: [:create, :update, :destroy]
    resource :item_singers, only: [:create]
    resource :reviews,      only: [:index, :new, :create, :update, :destroy]
    resource :favorites,    only: [:create, :destroy]
  end

  resources :stocks,            only: [:create, :update]
  resources :reviews,           only: [:index, :edit]
  resources :item_singers,      only: [:update]
  resources :item_genres,      only: [:create, :update]
  resources :genres,           only: [:index, :new, :edit, :create, :update, :destroy]
  resources :carts,            only: [:index, :new, :create, :update]
  resources :ship_to_anothers, only: [:create, :new, :update]

  resources :labels,           only: [:new, :create, :edit, :update, :destroy]
  resources :contacts,         only: [:new, :create]
  resources :responses,        only: [:new, :create]

  resources :songs, only: [:create, :update, :destroy]

  namespace :administrator do
    resources :items, only: [:index, :edit, :update, :destroy]
    resources :carts, only: [:index, :show]
    resources :reviews, only: [:index, :edit]
    resources :users, only: [:index]
    resources :contacts, only: [:index]
  end
end