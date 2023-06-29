Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root 'clients#login'
  get '/clients/:status', to: "clients#show"
  resources :clients 
  get "/new" => "clients#new"
  get "/index", to: "clients#index" 
  get "/login" => "clients#login"
  post "/login1" => "clients#login1"
 
end
