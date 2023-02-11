Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  #devise root
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end

   # API routes
   namespace :api do
    namespace :v1 do
      resources :users do 
        resources :posts do 
          resources :comments
          resources :likes
        end
      end
    end
  end

  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :new, :create, :destroy] do 
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
