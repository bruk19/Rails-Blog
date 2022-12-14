Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new form create destroy]
  end

  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index] do
        resources :posts, only: %i[index show] do
          resources :comments, only: %i[new create] do
          end
        end
      end
    end
  end
end
