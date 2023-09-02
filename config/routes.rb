Rails.application.routes.draw do
  resources :overs
  resources :innings
  resources :matches
  resources :teams
  resources :players
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#health"
end
