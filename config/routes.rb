Lifespan::Application.routes.draw do
  



  get "password_resets_donors/new"

  resources :medics
  resources :organizations
  resources :donors
  resources :sessions
  resources :medicsessions
  resources :password_resets
 

 
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

  match '/confirm/:id/:code', :to => 'donors#confirm_account'

  # match '/password_rests/:id/edit/:donormedic', :to => 'password_resets#'
  

end
