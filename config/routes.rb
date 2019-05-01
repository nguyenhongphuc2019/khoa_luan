Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  root "static_pages#index"
  get "/documents_liked", to: "documents_liked#index", as: "documents_liked"
  resources :keywords, only: :index
  resources :categories, only: %i(show)
  resources :user_upload_documents, only: :index
  resources :documents do
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
    resources :report_documents, only: %i(create destroy)
  end
  resources :verbs, only: %i(index) do
    resources :documents, only: %i(index)
  end
  resources :document_trackings, only: %i(create)
end
