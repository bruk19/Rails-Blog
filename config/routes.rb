Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

<<<<<<< HEAD
  devise_for :users
  
  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
=======
  get 'users/show'
  get 'posts/index'
  get 'posts/show'
>>>>>>> dev
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :form, :create]
  end

  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end
end
