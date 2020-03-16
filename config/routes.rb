Rails.application.routes.draw do
  get 'bookings/show'
  get 'bookings/index'
  get 'hosts/show'
  get 'hosts/index'
  root to: 'activities#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :activities, only: [ :index, :show ] do

  end
  resources :users, only: [ :show ] do
    resources :bookings, only: [ :index, :show ]
  end
  resources :hosts, only: [ :show ] do
    resources :bookings, only: [ :index, :show ]
    resources :activities, only: [ :index, :show ]
  end
end
