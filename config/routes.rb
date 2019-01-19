Rails.application.routes.draw do
  devise_for :students, controllers: { registrations: :registrations }
  devise_for :instructors, controllers: { registrations: :registrations }
  devise_for :developers, controllers: { registrations: :registrations }
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#root'

  get '/sign_in', to: 'pages#sign_in'
  get '/sign_up', to: 'pages#sign_up'

  resources :courses
  resources :lessons
  resources :exercises

  resources :students
  resources :instructors
  resources :developers
  resources :admins

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'Student', at: 'students', controllers: { registrations: 'api/v1/registrations', sessions: 'api/v1/sessions' }
      mount_devise_token_auth_for 'Instructor', at: 'instructors', controllers: { registrations: 'api/v1/registrations', sessions: 'api/v1/sessions' }
      mount_devise_token_auth_for 'Developer', at: 'developers', controllers: { registrations: 'api/v1/registrations', sessions: 'api/v1/sessions' }
      mount_devise_token_auth_for 'Admin', at: 'admins', controllers: { registrations: 'api/v1/registrations', sessions: 'api/v1/sessions' }

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
