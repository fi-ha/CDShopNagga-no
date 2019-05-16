Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :singers
  resources :favorites
  resources :users, only: [:show]

  # Cart画面は上から順にこのルーティングで進んで行きます。あとから修正している為ちょっと無理矢理感のあるルーティングとなっています。
  get 'carts/:id/edit',                 to: 'carts#edit', as: 'cart_edit'
  post 'carts/:id/edit',                to: 'carts#cartedit', as: 'cart_cartedit'
  get 'carts/:id/ship_to_another/edit', to: 'carts#ship', as: 'ship_to_another_edit'
  post 'carts/:id/ship_to_another/edit', to: 'carts#shipedit', as: 'ship_to_another_shipedit'
  get 'carts/:id/payment/edit',         to: 'carts#pay', as: 'payment_edit'
  post 'carts/:id/payment/edit',         to: 'carts#payedit', as: 'payment_payedit'
  get 'carts/:id/confirm/edit',         to: 'carts#confirm', as: 'confirm_edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items do
    resource :item_cart,  only: [:create, :update]
    resource :item_singer, only: [:create]
    resource :review,      only: [:index, :new, :create, :update, :destroy]
  end

  resources :stocks,            only: [:create, :update]
  resources :reviews,           only: [:index, :edit]
  resources :item_singers,      only: [:update]
  resources :item_genres,      only: [:create, :update]
  resources :genres,           only: [:index, :new, :edit, :create, :update, :destroy]
  resources :carts,            only: [:index, :new, :create, :update]
  resources :ship_to_anothers, only: [:create, :new, :update]

  resources :labels, only: [:new, :create, :edit, :update, :destroy]
  resources :contacts, only: [:new, :create]
  resources :responses, only: [:new, :create]

  resources :songs, only: [:create, :update, :destroy]

  namespace :administrator do
    resources :items, only: [:index]
    resources :carts, only: [:index, :show]
    resources :reviews, only: [:index, :edit]
    resources :users, only: [:index]
    resources :contacts, only: [:index]
  end
end
