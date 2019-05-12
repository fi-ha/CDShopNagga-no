Rails.application.routes.draw do
  get 'carts/:id/edit',                 to: 'cats#edit', as: 'cart_edit'
  get 'carts/:id/ship_to_another/edit', to: 'cats#edit', as: 'ship_to_another_edit'
  get 'carts/:id/payment/edit',         to: 'cats#edit', as: 'payment_edit'
  get 'carts/:id/confirm/edit',         to: 'cats#edit', as: 'confirm_edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :genres, only: [:index, :new, :edit, :create, :update, :destroy]
  resources :carts,  only: [:index, :new, :create, :update]

end
