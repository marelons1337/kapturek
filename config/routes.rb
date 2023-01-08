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
    resources :expenses do
      collection do
        get :fetch_expensables
      end
    end
    resources :incomes do
      collection do
        get :fetch_incomables
      end
    end

    # index for transactions controller
    get "transactions", to: "transactions#index"
  end
end
