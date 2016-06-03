Rails.application.routes.draw do
  resources :users
  resources :ideas do
    resources :notes, :tasks
  end

  get    '/signup'  => 'users#new'
  get    '/login'   => 'sessions#new'
  post   '/login'   => 'sessions#create'
  delete '/logout'  => 'sessions#destroy'

  root 'home#index'
end
