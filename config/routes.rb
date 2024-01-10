Rails.application.routes.draw do
  get 'rooms/index'
  # ログイン、アカウント編集後、任意のページに推移させるための記述
  devise_for :users, controllers: {
    registrations:  'users/registrations'
  }
devise_scope :user do
    get '/users/profile/edit', to: 'users/registrations#edit_profile', as: 'edit_user_profile'
    put '/users/profile/edit', to: 'users#update_profile' 
    patch '/users/profile/edit', to: 'users#update_profile'

  end
  root 'home#top'
  get 'users/profile', to: 'users#profile', as: 'user_profile'
  get 'users/account', to: 'users#account', as: 'user_acount'
  put '/users/:id/update', to: 'users#update', as: 'update_user'

#newからdeleteまでのルーテイングを一括で作っているっぽい
  resource :reservations
  resources :users
  resources :rooms
  namespace :users do
    get 'users/edit', to: 'users#edit'
    put 'update', to: 'registrations#update'
  end



  
 


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
