Rails.application.routes.draw do

  devise_for :users
    resources :books do
      resources :reviews
      resources :likes, only: [:create, :destroy]
    end

    root "books#index"



end
