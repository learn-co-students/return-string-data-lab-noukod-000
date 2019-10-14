Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products, only: [:index, :new, :create]

  # this route will get the product description as a plain string
  get '/products/:id/description', to: 'products#description'

  # this route will check if inventory is available
  get '/products/:id/inventory', to: 'products#inventory'
end
