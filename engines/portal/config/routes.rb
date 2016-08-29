Portal::Engine.routes.draw do

  root 'dashboard#index'
  
  resources :articles,  path: 'artigos'
  resources :authors,   path: 'autores'
  resources :juridical_reports, path: 'boletim_juridico'
  resources :questions, path: 'questoes'
end
