Rails.application.routes.draw do
  resources :companies, except: [:show, :destroy]
  resources :people, only: [:index, :new, :create]

  root to: 'people#index'
end
