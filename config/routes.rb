Lifespan::Application.routes.draw do
  

  resources :medics
  resources :organizations
  resources :donors
  resources :sessions
  resources :medicsessions
 
 post "donors/send_request"
 
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
  match '/send_one_blood_type', :to => 'donors#send_one_blood_type'
  
end
