Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/customers', to: 'customers#index'
  get '/customers/new', to: 'customers#new'
  post '/customers', to: 'customers#create'
  get '/customers/:id', to: 'customers#show'
  get '/customers/:id/orders', to: 'customer_orders#index'

  get '/orders', to: 'orders#index'
  get '/orders/:id', to: 'orders#show'

  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/new', to: 'restaurants#new'
  post '/restaurants', to: 'restaurants#create'
  get '/restaurants/:restaurant_id', to: 'restaurants#show'
  get '/restaurants/:restaurant_id/edit', to: 'restaurants#edit'
  patch '/restaurants/:restaurant_id', to: 'restaurants#update'
  
  get '/restaurants/:restaurant_id/employees', to: 'restaurant_employees#index'
  get '/restaurants/:restaurant_id/employees/new', to: 'restaurant_employees#new'
  post '/restaurants/:restaurant_id/employees', to: 'restaurant_employees#create'

  get '/employees', to: 'employees#index'
  get '/employees/:id', to: 'employees#show'
  get '/employees/:id/edit', to: 'employees#edit'
  patch '/employees/:id', to: 'employees#update'
end
