Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get 'users/index'
  get 'users/account'
  get 'users/profiles/show', to: 'profiles#show'
  get 'users/profiles/edit', to: 'profiles#edit'
  patch 'users/profiles/:id', to: 'profiles#update'
  put 'users/account', to: 'devise/registrations#update'
  
  resources :users
  
  resources :rooms do
    collection do
      get :search, :search_address
    end
  end
  
  resources :reservations do
    collection do
      post :confirm
    end
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
