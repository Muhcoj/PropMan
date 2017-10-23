Rails.application.routes.draw do

  default_url_options :host => 'localhost', port: 3000

  resources :kontoumsatzs do 
    collection { post :import }
  end
  
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
  resources :home_posts
  resources :finances do 
    member do
      get :paid
    end
  end

  resources :finances do
    resources :users    
    member do  
      get 'send_invoice_reminder' => 'finances#send_invoice_reminder'  
    end  
  end 

  devise_for :users, skip: [:registrations]

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  root to: 'static#homepage'

  get 'static/contact'

  post 'static/thank_you'
end


