Rails.application.routes.draw do
  devise_for :students
  devise_for :instructors
  devise_for :developers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
