Rails.application.routes.draw do

  root 'customers#index'  
  resources :customers
  resources :professionals
  resources :appointments

end
