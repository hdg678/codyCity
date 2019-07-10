Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#root'

  get '/sign_in', to: 'pages#sign_in'
  get '/sign_up', to: 'pages#sign_up'

  resources :organizations, only: [:index, :show]

  resources :courses
  resources :lessons
  resources :exercises do
    get 'exercise_file', to: 'exercises#download_exercise_file'
    get 'test_file', to: 'exercises#download_test_file'
  end

  resources :students
  resources :instructors
  resources :developers
  resources :admins

  resources :sessions, only: [:new, :create, :destroy]

  namespace :api do
    namespace :v1 do
      resources :students, only: [:index, :show]
      resources :instructors, only: [:index, :show]
      resources :developers, only: [:index, :show]

      get 'tokens/generate', to: 'organization_user_tokens#generate'

      resources :courses do
        resources :lessons do
          resources :exercises, only: [:index, :show]
          post 'exercises/push', to: 'exercises#push'
        end
      end
    end
  end
end
