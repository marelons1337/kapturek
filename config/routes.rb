Rails.application.routes.draw do
  resources :tenants
  resources :flats
  resources :buildings

  get '/', to: 'buildings#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
