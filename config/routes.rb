Rails.application.routes.draw do
  resources :ideas do
    resources :notes
  end

  root 'ideas#index'
end
