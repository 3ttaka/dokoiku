Rails.application.routes.draw do
  root to: 'shops#search'

  devise_for :users
  resources :shops, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    collection do
      get 'search', to: 'shops#search', as: 'search'
      get 'search_by_reviews', to: 'shops#search_by_reviews', as: 'search_by_reviews'
    end
    member do
      get 'reviews', to: 'shops#reviews'
      get 'photos', to: 'shops#photos'
    end
    resources :reviews, only: [:new, :create, :show, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index]
end
