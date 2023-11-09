Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
  resources :posts do
    get 'comments', to: 'comments#index' # Route to fetch comments for a specific post
  end
  root "users#index"
end
