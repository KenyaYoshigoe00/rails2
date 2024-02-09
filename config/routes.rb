Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get 'users/index'
  get 'users/account'
  get 'users/account_edit'
  get 'users/profiles/show', to: 'profiles#show'
  get 'users/profiles/edit', to: 'profiles#edit'
  
  resources :users
  resources :rooms

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
