Rails.application.routes.draw do
  devise_for :users

  resources :users, only: %i[show edit] do
    resources :chatrooms, only: :index, path: :inbox
  end

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :chatrooms, only: %i[show create] do
    resources :messages, only: [:create]
  end
end
