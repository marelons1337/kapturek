# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root "application#dashboard"

  namespace :property do
    resources :sales
    resources :rentals
  end
end
