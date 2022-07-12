Rails.application.routes.draw do
  
  root 'appointments#index'  
  resources :customers
  resources :professionals
  resources :appointments
  get 'report/index'

end
