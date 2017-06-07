Rails.application.routes.draw do
  
  namespace :admin do
    resources :users
		resources :finances
		resources :posts
		resources :admin_users

    root to: "users#index"
  end

  devise_scope :user do
    delete 'logout', to: 'static#homepage'
  end

  resources :posts
  resources :finances
  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'

end
