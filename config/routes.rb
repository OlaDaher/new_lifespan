Lifespan::Application.routes.draw do
  resources :organizations
  resources :donors
  resources :sessions
 
  root :to => 'pages#home'
  match '/home', :to => 'pages#home'
  match '/about', :to => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/privacy', :to => 'pages#privacy'
 
  match '/signup', :to => 'donors#new'
  match '/login', :to => 'sessions#new'
  match '/logout', :to => 'sessions#destroy'
end
