Rails.application.routes.draw do
  get 'popular_products/popular'
  get 'admin/home'
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'
  resources :orders do 
    resource :orderitems
  end
  
  devise_for :users do
    resources :orders
  end
  
  get '/checkout' => 'cart#createOrder'
  
  resources :items
  root 'items#index'
  
  post '/search' => 'items#search'
  
  get '/paid/:id', to: 'items#paid'
  
  get '/cart/clear', to: 'cart#clear'
  get '/cart/remove/:id', to: 'cart#remove'
  get '/cart/reduce/:id', to: 'cart#reduce'
  get '/cart/increase/:id', to: 'cart#increase'
  get '/cart', to: 'cart#index'
  get '/cart/:id', to: 'cart#add'
  
  get '/login', to: 'user#login' 
  get '/logout', to: 'user#logout'
  get '/popular_products', to: 'popular_products#popular'

  get '/admin', to: 'admin#users'
  get '/admin/upgrade/:id', to: 'admin#upgrade_admin'
  get '/admin/downgrade/:id', to: 'admin#downgrade_admin'
  
  get '/admin/inventory', to: 'admin#manageInventory'
  

  get '/admin/category', to: 'categories#index'
  post 'admin/category' => 'items#index'
  
  get 'category/:title', to: 'items#category'
  
  resources :categories
  
  
  get '/paid', to: 'cart#paid'
  
  root :to => 'site#index'
end

 
