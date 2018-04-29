Rails.application.routes.draw do
  resources :custom_lists
  root to: 'visitors#index'
end
