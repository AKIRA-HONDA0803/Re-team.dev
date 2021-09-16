Rails.application.routes.draw do
  devise_for :admins
  devise_for :members
  namespace :admin do
    get 'products/index'
    get 'products/show'
    get 'products/edit'
    get 'products/update'
    get 'products/new'
    get 'products/create'
    get 'products/destroy'
  end
  namespace :admin do
    get 'order_products/update'
  end
  namespace :admin do
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    get 'members/index'
    get 'members/show'
    get 'members/edit'
    get 'members/update'
  end
  # namespace :admin do
  #   get 'genres/index'
  #   get 'genres/create'
  #   get 'genres/edit'
  #   get 'genres/update'
  # end
   namespace :admin do
    root to: 'homes#top'
   end
  namespace :admin do
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
