Rails.application.routes.draw do
  # default route
  root "welcome#home"

  # SIGNUP ROUTE 
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  # LOGIN ROUTE 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  # LOGOUT ROUTE 
  delete '/logout' => 'sessions#destroy'

  # Omni-Auth Route 
  get "/google_auth/:provider/callback" => 'sessions#google_auth'

  resources :officers do 
    resources :reviews 
  end 

  resources :reviews 

  resources :users do 
    resources :reviews, shallow: true 
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
