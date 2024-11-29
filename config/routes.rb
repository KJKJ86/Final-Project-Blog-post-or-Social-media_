Rails.application.routes.draw do
  devise_for :users
  root "posts#index"

  resources :posts do
    member do
      patch :like
    end
    resources :comments, only: [:create, :destroy]
  end
end
