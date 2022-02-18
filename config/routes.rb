Rails.application.routes.draw do
  devise_for :users

  root 'memes#index'
  get "/popular", to: "memes#popular"
  resources :memes, only: [:show, :new, :create] do
    resources :comments, only: :create
    resources :votes, only: :create
  end

  resources :categories, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
