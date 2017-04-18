Rails.application.routes.draw do
  
  resources :posts
  resources :finances
  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'

end
