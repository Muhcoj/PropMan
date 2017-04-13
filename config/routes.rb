Rails.application.routes.draw do
  
  resources :finances
  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'

end
