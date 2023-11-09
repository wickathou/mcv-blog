Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
  post "/auth/login", to: "authentication#login"
  root "users#index"
end
