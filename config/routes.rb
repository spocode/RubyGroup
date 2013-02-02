Rails3MongoidDevise::Application.routes.draw do
  
  namespace :admin do
    resources :organizations
    resources :users
    root to: "dashboard#index"
  end
  
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  
end