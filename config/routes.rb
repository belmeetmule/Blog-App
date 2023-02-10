Rails.application.routes.draw do
  #devise root
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  namespace :api do
    resources :users
  end

  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :new, :create, :destroy] do 
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
