Rails.application.routes.draw do
  resources :payments
  resources :tenants
  resources :flats
  resources :buildings

  get '/', to: 'buildings#index', as: 'root'

  get '/buildings/:id/find_flats', to: 'buildings#find_belonging_flats', constraints: { format: 'json' }, as: 'find_flats'
  get '/flats/:id/get_tenants', to: 'flats#get_tenants', constraints: { format: 'json' }, as: 'get_tenants'

end
