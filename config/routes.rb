Rails.application.routes.draw do
  root to: 'shops#search'

  devise_for :users
  resources :shops, only: [:new, :show] do
    collection do
      get 'search', to: 'shops#search', as: 'search'
      get 'results', to: 'shops#results', as: 'results'
    end
  end
end
