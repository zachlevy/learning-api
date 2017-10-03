Rails.application.routes.draw do
  resources :collections
  resources :anonymous_users
  resources :users do
    collection do
      get 'me' => 'users#get_me'
    end
  end
  post 'user_token' => 'user_token#create'
  resources :definitions
  resources :feedbacks
  resources :profiles do
    collection do
      get 'me' => 'profiles#get_me'
      put 'me' => 'profiles#put_me'
    end
  end
  resources :events
  resources :challenge_responses
  resources :challenges
  resources :challenge_types
  resources :course_contents
  resources :contents
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
