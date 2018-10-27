Rails.application.routes.draw do
  resources :lessons
  resources :courses
  resources :instructors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :students
end
