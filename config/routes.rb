Rails.application.routes.draw do
  devise_for :students, controllers: { registrations: :registrations }
  devise_for :instructors, controllers: { registrations: :registrations }
  devise_for :developers, controllers: { registrations: :registrations }
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'Student', at: 'students'
      resources :students, only: [:index, :show]

      mount_devise_token_auth_for 'Instructor', at: 'instructors'
      resources :instructors, only: [:index, :show]

      mount_devise_token_auth_for 'Developer', at: 'developers'
      resources :developers, only: [:index, :show]

      mount_devise_token_auth_for 'Admin', at: 'admins'



      resources :courses
    end
  end
end
