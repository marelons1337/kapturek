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
    resources :payments do
      collection do
        get :fetch_payment_kind_model_values
      end
    end
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
  end
end
