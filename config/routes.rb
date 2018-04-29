Rails.application.routes.draw do
  resources :people
  resources :custom_lists
  root to: 'visitors#index'
end
