Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'wfiles#index'
  resources :wfiles
  get 'ex', to: 'wfiles#ex'
  # Defines the root path route ("/")
  # root "articles#index"
end
