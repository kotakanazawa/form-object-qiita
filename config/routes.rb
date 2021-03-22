Rails.application.routes.draw do
  root 'formats#index'
  resources :formats, only: [:index, :new, :create]
end
