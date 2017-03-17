Rails.application.routes.draw do
  root to: "messages#index"

  mount ActionCable.server => "/cable"

  get "/signup", to: "users#new"
  post "/users", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  # resources :messages, only: [:index, :create]
  resources :chatrooms, only: [:show, :create]

  namespace :api do
    namespace :v1 do
      resources :messages, only: [:index, :create]
    end
  end
end
