Rails.application.routes.draw do
  root 'docs#index'
  resources :todos
end
