Rails.application.routes.draw do
  
  resources :yoga_classes do 
    resources :students, only: [:index, :show, :new, :create, :edit, :update]
  end 

  resources :students

  resources :studios, only: [:index, :show]
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => {:registrations => 'registrations', :omniauth_callbacks => 'callbacks'}

  root to: 'application#welcome'
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new', as: 'login'
    get 'signup', to: 'devise/registrations#new', as: 'signup'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end 


end
