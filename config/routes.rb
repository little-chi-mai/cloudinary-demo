Rails.application.routes.draw do
  
  root :to => 'brands#index'
  resources :brands
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
