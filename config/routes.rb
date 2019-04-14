Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "static_pages#index"
  resources :categories, only: %i(show)
  resources :user_upload_documents, only: :index
  resources :documents do
    resources :votes, only: %i(:create, :destroy)
  end
  resources :verbs, only: %i(index) do
    resources :documents, only: %i(index)
  end
  resources :document_trackings, only: %i(create)
end
