Rails3MongoidDevise::Application.routes.draw do
  
  resources :organizations do
  end


  namespace :admin do
    resources :organizations do
      resources :locations
    end
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