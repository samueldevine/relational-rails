Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/customers', to: 'customers#index'
  get '/customers/new', to: 'customers#new'
  post '/customers', to: 'customers#create'
  get '/customers/:id', to: 'customers#show'

  get '/customers/:id/orders', to: 'customer_orders#index'
  get '/customers/:id/orders/new', to: 'customer_orders#new'
  post '/orders', to: 'customer_orders#create'
  
  get '/customers/:id/edit', to: 'customers#edit'
  patch '/customers/:id', to: 'customers#update'

  get '/orders', to: 'orders#index'
  get '/orders/:id', to: 'orders#show'

  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/:id', to: 'restaurants#show'
  get '/restaurants/:id/employees', to: 'employees#by_restaurant'

  get '/employees', to: 'employees#index'
  get '/employees/:id', to: 'employees#show'
end
