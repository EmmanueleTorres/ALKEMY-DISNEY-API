Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :characters
  resources :films do
    resources :casts, only: [:new, :create]
  end
  resources :casts, only: :destroy
  resources :genres, only: :index
end
