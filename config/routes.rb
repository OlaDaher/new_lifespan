Lifespan::Application.routes.draw do
  resources :donors
  resources :donors
  resources :donorsessions
 
  root :to => 'pages#home'
  match '/home', :to => 'pages#home'
  match '/about', :to => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/privacy', :to => 'pages#privacy'
 
  match '/signup', :to => 'donors#new'
  match '/login', :to => 'donorsessions#new'
  match '/logout', :to => 'donorsessions#destroy'
end
