Rails.application.routes.draw do
  root to: 'activities#index'

  devise_for :users
  devise_for :hosts, controllers:  { sessions: 'sessions', registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [ :show ] do
    resources :bookings, only: [ :index, :show] do
      resources :reviews, only: [ :new, :create ]
    end
  end
  resources :hosts, only: [ :show ] do
    resources :available_dates, only: [ :index, :new, :create, :destroy ]
    resources :activities, only: [ :index, :show, :new, :create, :edit, :update, :destroy ]
    resources :bookings, only: [ :index, :show]
  end
  resources :activities, only: [ :index, :show ] do
    resources :users, only: [] do
      resources :bookings, only: [:new, :create, :destroy]
    end
  end
end
