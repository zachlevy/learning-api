Rails.application.routes.draw do
  resources :challenges
  resources :challenge_types
  resources :course_contents
  resources :contents
  resources :courses
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
