# frozen_string_literal: true

Rails.application.routes.draw do
  resources :roles
  resources :gifts
  resources :man_of_the_matches
  resources :overs
  resources :innings
  resources :matches
  resources :teams
  resources :players

  resources :users do
    # get "onboarding", on: :collection
    get "logout", on: :collection
    post "login", on: :collection
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "application#health"
end
