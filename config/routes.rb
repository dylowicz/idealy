Rails.application.routes.draw do
  resources :ideas do
    resources :notes, :tasks
  end

  root 'ideas#index'
end
