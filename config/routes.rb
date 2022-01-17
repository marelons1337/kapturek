Rails.application.routes.draw do
  resources :payments
  resources :tenants
  resources :flats
  resources :buildings

  get '/', to: 'buildings#index', as: 'root'

  get '/buildings/:id/find_flats', to: 'buildings#find_belonging_flats', constraints: { format: 'json' }, as: 'find_flats'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
