Rails.application.routes.draw do
  resources :users
  post 'user_token' => 'user_token#create'
  resources :definitions
  resources :feedbacks
  resources :profiles
  resources :events
  resources :challenge_responses
  resources :challenges
  resources :challenge_types
  resources :course_contents
  resources :contents
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
