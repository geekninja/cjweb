Administrator::Engine.routes.draw do
  root 'dashboard#index'

  resources :articles
  resources :authors
  resources :questions
  resources :users
end
