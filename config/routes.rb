Rails.application.routes.draw do
  devise_for :users # , controllers: {omniauth_callbacks: "users/omniauth_callbacks" }
  # resources :users, only: [:edit, :update] do
  #   collection do
  #     get 'profile'
  #     get 'bookings_sent'
  #   end
  # end

  resources :tasks, only: [:index, :show] do
    resources :bookings, only: [:index, :new, :create, :update]
  end

  namespace :account do
    resources :tasks, except: [:show]
  end

  #     collection do
  #       get 'bookings_received'
  #   end
  #   resources :flats, only: [:index, :new, :create, :show, :edit, :update]
  # end
end
