Rails.application.routes.draw do
  #devise root
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :new, :create] do 
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
end
