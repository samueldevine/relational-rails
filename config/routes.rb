Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/customers', to: 'customers#index'
  get '/customers/new', to: 'customers#new'
  post '/customers', to: 'customers#create'
  get '/customers/:id', to: 'customers#show'
  get '/customers/:customer_id/orders', to: 'orders#by_customer'

  get '/orders', to: 'orders#index'
  get '/orders/:id', to: 'orders#show'

  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/:restaurant_id', to: 'restaurants#show'
  get '/restaurants/:restaurant_id/employees', to: 'restaurant_employees#index'
  
  get '/employees', to: 'employees#index'
  get '/employees/:id', to: 'employees#show'
end
