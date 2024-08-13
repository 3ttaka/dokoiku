Rails.application.routes.draw do
  root to: 'shops#search'

  devise_for :users
  resources :shops, only: [:new, :create, :index, :show] do
    collection do
      get 'search', to: 'shops#search', as: 'search'
      get 'search_by_reviews', to: 'shops#search_by_reviews', as: 'search_by_reviews'
    end
    resources :reviews, only: [:new, :create]
  end
end
