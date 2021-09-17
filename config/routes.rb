Rails.application.routes.draw do
  devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
}
 root to: 'admin/homes#top'
  
  namespace :admin do
    resources :members, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
