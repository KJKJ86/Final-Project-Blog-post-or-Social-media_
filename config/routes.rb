# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "posts#index"

  resources :posts do
    member do
      patch :like
    end
    resources :comments, only: %i[create destroy]
  end
end
