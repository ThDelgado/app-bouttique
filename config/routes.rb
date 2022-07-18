Rails.application.routes.draw do
  resources :line_items
  resources :orders
  resources :products
    devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'store#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
