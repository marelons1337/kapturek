# frozen_string_literal: true

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  namespace :customer do
    resources :clients
  end
  root "application#dashboard"

  namespace :property do
    resources :properties
    resources :sales
    resources :rentals
    resources :expenses
  end
end
