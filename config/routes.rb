Rails.application.routes.draw do
  devise_for :users
  resources :secret_code, only: %i[index create]
  root 'user#index'
end
