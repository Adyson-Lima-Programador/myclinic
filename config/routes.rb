Rails.application.routes.draw do
  get 'manual/manual_myclinic'
  
  root 'appointments#index'  
  resources :customers
  resources :professionals
  resources :appointments
  get 'report/index'

end
