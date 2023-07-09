Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :projects

  root to: "projects#index"

  devise_scope :user do
    get "sair", to: "custom_sessions#destroy", as: :custom_destroy_user_session
  end
end
