Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  resources :questions do
    resources :answers, only: :create
  end
  resources :markdown_previews, only: :create
  resources :markdown_attachments, only: :create
end
