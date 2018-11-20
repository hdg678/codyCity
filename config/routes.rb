Rails.application.routes.draw do
  devise_for :students, controllers: { registrations: :registrations }
  devise_for :instructors, controllers: { registrations: :registrations }
  devise_for :developers, controllers: { registrations: :registrations }
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
