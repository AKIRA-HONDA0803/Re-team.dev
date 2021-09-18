Rails.application.routes.draw do
  devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
}

  namespace :admin do
    resources :members, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update] do
      resources :order_products, only: [:update]
    end
    resources :products
    resources :genres, only: [:index, :create, :edit, :update]
    root to: 'homes#top'
  end

  devise_for :members, controllers: {
  sessions:      'public/sessions',
  passwords:     'public/passwords',
  registrations: 'public/registrations'
}
  get 'members/unsubscribe' => 'public/members#unsubscribe'
  patch 'members/withdraw' => 'public/members#withdraw'
  resources :members, only: [:show, :edit, :update]

  post 'orders/confirm' => 'public/orders#confirm'
  get 'orders/complete' => 'public/orders#complete'
  resources :orders, only: [:index, :show, :new, :create]

  delete 'cart_products/destroy_all' => 'public/cart_products#destroy_all'
  resources :cart_products, only: [:index, :create, :destroy, :update]

  resources :addresses, except: [:show, :new]

  resources :products, only: [:index, :show]

  get 'about' => 'public/homes#about'
  root to: 'public/homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
