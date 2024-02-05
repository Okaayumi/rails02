Rails.application.routes.draw do
  get 'reservations/index'
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
  get 'rooms/own', to: 'rooms#own' ,as:'room_own'
  #get 'reservations/confirm' ,to: 'reservations#confirm'

  post 'reservations/confirm'

#newからdeleteまでのルーテイングを一括で作っているっぽい
  resources :reservations
  resources :users
  resources :rooms do
    collection do
        get 'search'
    end
  end

  resource :posts
  namespace :users do
    get 'users/edit', to: 'users#edit'
    put 'update', to: 'registrations#update'

 
  

  
  end



  
 


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
