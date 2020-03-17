Rails.application.routes.draw do
  root to: 'activities#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [ :show ] do
    resources :bookings, only: [ :index, :show]
  end
  resources :hosts, only: [ :show ] do
    resources :activities, only: [ :index, :show, :new, :create ]
    resources :bookings, only: [ :index, :show]
  end
  resources :activities, only: [ :index, :show ] do
    resources :users, only: [] do
      resources :bookings, only: [:new, :create, :destroy]
    end
  end
end
