Portal::Engine.routes.draw do

  root 'dashboard#index'
  
  resources :articles,  path: 'artigos'
  resources :authors,   path: 'autores'

end
