Rails.application.routes.draw do
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
  namespace :adomin do
    get 'orders/show'
    get 'orders/update'
  end
  namespace :adomin do
    get 'oders/show'
    get 'oders/update'
  end
  namespace :adomin do
    get 'members/index'
    get 'members/show'
    get 'members/edit'
    get 'members/update'
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
