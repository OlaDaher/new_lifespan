Lifespan::Application.routes.draw do
  

  resources :medics
  resources :organizations
  resources :donors
  resources :sessions
  resources :medicsessions
 
  root :to => 'pages#home'
  match '/home', :to => 'pages#home'
  match '/about', :to => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/privacy', :to => 'pages#privacy'
 
  match '/signup', :to => 'donors#new'
  match '/login', :to => 'sessions#new'
  match '/logout', :to => 'sessions#destroy'
  match '/register', :to => 'organizations#new'
  match '/join', :to => 'medics#new'
  match '/signin', :to => 'medicsessions#new'
  match '/signout', :to => 'medicsessions#destroy'
  match '/send_request', :to => 'donors#send_request'
  
end
