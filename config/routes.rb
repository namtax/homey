Rails.application.routes.draw do
  get "projects/index"
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "projects#index"
end
