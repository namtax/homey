Rails.application.routes.draw do
  devise_for :users
  get 'comments/index'
  get "projects/index"
  resources :projects do 
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "projects#index"
end
