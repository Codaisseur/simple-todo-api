Rails.application.routes.draw do
  root 'docs#index'
  resources :todos, except: [:new, :edit]
end
