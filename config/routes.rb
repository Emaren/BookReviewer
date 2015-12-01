Rails.application.routes.draw do

  get 'votes/create'

  get 'votes/destroy'

  devise_for :users
    resources :books do

      resources :likes, only: [:create, :destroy]
      resources :favourites, only: [:create, :destroy]
    end
    resources :books do
    resources :reviews do
      resources :votes, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
    end
    root "books#index"



end
