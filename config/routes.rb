Rails.application.routes.draw do
  devise_for :admins, controllers: {
     sessions: 'admins/sessions',
    registration: 'admins/registrations'
   }
  resources :line_items
  
    resources :orders
    resources :products
  
  resource :cart, only: [:show, :update]

    devise_for :users, controllers: {
    sessions: 'users/sessions',
    registration: 'users/registrations'
  }
  resource :stores, only: [:index, :show, :update]
  root 'stores#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
