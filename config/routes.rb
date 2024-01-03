Rails.application.routes.draw do
  # ログイン、アカウント編集後、任意のページに推移させるための記述
  devise_for :users, controllers: {
    registrations:  'users/registrations'
  }
  root 'home#top'
  get 'users/profile', to: 'users#profile', as: 'user_profile'
  get 'users/account', to: 'users#account', as: 'user_acount'

  resource :reservations

 


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
