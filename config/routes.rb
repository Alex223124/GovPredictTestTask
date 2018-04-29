Rails.application.routes.draw do
  resources :federal_legislators
  resources :people
  resources :custom_lists
  root to: 'visitors#index'
end
