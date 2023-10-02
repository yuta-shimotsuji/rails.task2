Rails.application.routes.draw do

  devise_for :users
  root to: 'users#top'

  get 'users/index'
  get 'users/:id/profile', to: 'users#profile', as: 'user_profile'
  get 'users/:id/profile_edit', to: 'users#profile_edit', as: 'user_profile_edit'
  resources :users, only: [:show,:update]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
