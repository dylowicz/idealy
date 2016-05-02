Rails.application.routes.draw do
  resources :users
  resources :ideas do
    resources :notes, :tasks
  end
  
  get '/signup' => 'users#new'

  root 'ideas#index'
end
