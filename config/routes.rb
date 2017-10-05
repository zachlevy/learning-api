Rails.application.routes.draw do
  resources :collections, only: [:index, :show]
  resources :anonymous_users, only: [:create]
  resources :users, only: [:create] do
    collection do
      get 'me' => 'users#get_me'
    end
  end
  post 'user_token' => 'user_token#create'
  resources :definitions, only: [:index, :show, :create]
  resources :feedbacks, only: [:create]
  resources :profiles, only: [] do
    collection do
      get 'me' => 'profiles#get_me'
      put 'me' => 'profiles#put_me'
    end
  end
  resources :events, only: [:index, :show]
  resources :challenge_responses, only: [:index, :show, :create]
  resources :challenges, only: [:index, :show]
  resources :challenge_types, only: [:index, :show]
  resources :courses, only: [:index, :show]

  # admin routes
  namespace :admin do
    resources :collections
    resources :anonymous_users
    resources :users
    resources :definitions
    resources :feedbacks
    resources :profiles
    resources :events
    resources :challenge_responses
    resources :challenges
    resources :challenge_types
    resources :contents
    resources :courses
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
