Rails.application.routes.draw do
  
  get "signup" => "users#new"
  
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout"=> "sessions#destory"
  
  resources :users, only: [:new, :create, :index, :show] 
  resources :tasks
  
  get "tasks" => "tasks#index"
  root to: "users#new"
end
