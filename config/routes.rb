Rails.application.routes.draw do
  
  resources :finances
  devise_for :users
  root to: 'static#homepage'

end
