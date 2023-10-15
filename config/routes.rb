Rails.application.routes.draw do

  devise_for :users
  root to: 'rooms#index'

  get 'users/index'
  get 'users/:id/profile', to: 'users#profile', as: 'user_profile'
  get 'users/:id/profile_edit', to: 'users#profile_edit', as: 'user_profile_edit'

  get 'rooms/index_current_user', to: 'rooms#index_current_user' , as: 'index_current_user'

  resources :users, only: [:show,:update]
  resources :rooms do
    collection do
     get 'search'
    end
    resources :reservations, only: [:create, :destroy]
  end

  get 'reservations/index'
  get 'reservations/:id/reserve_form', to: 'reservations#reserve_form', as: 'reservation_reserve_form'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
