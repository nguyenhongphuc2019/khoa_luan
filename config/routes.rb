Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "static_pages#index"
  resources :categories, only: %i(show)
  resources :documents, only: %i(show index) do
    resources :votes, only: [:create, :destroy]
  end
  resources :verbs, only: %i(index) do
    resources :documents, only: %i(index)
  end
end
