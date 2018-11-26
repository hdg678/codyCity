Rails.application.routes.draw do
  devise_for :students, controllers: { registrations: :registrations }
  devise_for :instructors, controllers: { registrations: :registrations }
  devise_for :developers, controllers: { registrations: :registrations }
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      devise_for :students, controllers: { registrations: 'api/v1/registrations' }
      resources :students, only: [:index, :show, :create]

      devise_for :instructors, controllers: { registrations: 'api/v1/registrations' }
      resources :instructors, only: [:index, :show, :create]

      devise_for :developers, controllers: { registrations: 'api/v1/registrations' }
      resources :developers, only: [:index, :show, :create]

      devise_for :admins
    end
  end
end
