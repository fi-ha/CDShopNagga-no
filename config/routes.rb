Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    }
  root :to => "items#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :singers, only: [:index, :edit, :create, :update, :destroy]
  resources :favorites

  resources :users, only: [:show, :edit, :update] do
    resource :favorites, only: [:index]
  end
  patch 'users/:id/edit', to: 'users#user_update', as: 'user_edit'

  # Cart画面は上から順にこのルーティングで進んで行きます。あとから修正している為ちょっと無理矢理感のあるルーティングとなっています。
  patch 'carts/:id/total_price_create',  to: 'carts#total_price_create', as: 'cart_total_price'
  post 'carts/edit',                    to: 'carts#create',  as: 'cart_create'
  get  'carts/:id/edit',                to: 'carts#edit',    as: 'cart_edit'
  post 'carts/:id/edit',                to: 'carts#cartedit',as: 'cart_cartedit'
  get  'carts/:id/ship_to_another/edit',to: 'carts#ship',    as: 'ship_to_another_edit'
  post 'carts/:id/ship_to_another/edit',to: 'carts#shipedit',as: 'ship_to_another_shipedit'
  get  'carts/:id/payment/edit',        to: 'carts#pay',     as: 'payment_edit'
  patch 'carts/:id/payment/edit',        to: 'carts#payedit', as: 'payment_payedit'
  get  'carts/:id/confirm/edit',        to: 'carts#confirm', as: 'confirm_edit'
  get  'carts/:id/ginko/edit',          to: 'carts#ginko',   as: 'confirm_ginko'
  get  'carts/:id/daibiki/edit',        to: 'carts#daibiki', as: 'confirm_daibiki'
  get  'carts/:id/cred/edit',           to: 'carts#cred',    as: 'confirm_cred'
  get  'carts/:id/finish',              to: 'carts#finish',  as: 'finish'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items do
    resource :item_carts,  only: [:create, :update, :destroy]
    resource :item_singers, only: [:create]
    resources :item_genres,      only: [:create, :update]
    resource :reviews,      only: [:new, :create]
    resource :favorites,    only: [:create, :destroy]
      patch :toggle_status
  end

  resources :stocks,            only: [:create, :update]
  resources :reviews,           only: [:index, :edit, :update, :destroy]
  resources :item_singers,      only: [:update]
  resources :genres,           only: [:index, :new, :edit, :create, :update, :destroy]

  resources :carts,            only: [:index, :new, :show, :edit, :create, :update] do
    resource :item_carts,   only: [:edit, :update]
  end
  resources :item_carts, only: [:destroy, :update]
  resources :reviews,         only: [:index, :edit, :update, :destroy]
  resources :stocks,          only: [:create, :update]
  resources :item_singers,    only: [:update]
  resources :carts,           only: [:index, :new, :create, :update]
  resources :ship_to_anothers,only: [:create, :new, :update]
  resources :contacts, only: [:new, :create]
  resources :labels, only: [:index, :create, :edit, :update, :destroy]
  resources :contacts,         only: [:new, :create]
  resources :responses,        only: [:new, :create]
  resources :songs, only: [:create, :update, :destroy]

  namespace :administrator do
    resources :genres,   only: [:index, :new, :edit, :create, :update, :destroy]
    resources :labels,   only: [:index, :create, :edit, :update, :destroy]
    resources :singers,  only: [:index, :edit, :create, :update, :destroy]
    resources :items,    only: [:new, :index, :edit, :update, :destroy] do
      patch :toggle_status
    end
    resources :carts,    only: [:index, :show]
    resources :reviews,  only: [:index, :edit, :destroy]
    resources :users,    only: [:index]
    resources :contacts, only: [:index, :show]
    resources :respons,  only: [:create, :new, :show]
    get 'user/:id', to: 'users#switch', as: 'switch'
    get 'adminchange/:id', to: 'users#adminchange', as: 'adminchange'
  end

  resources :concepts, only: [:index]



  resources :carts do
    patch :toggle_status
  end


end
