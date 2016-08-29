Administrator::Engine.routes.draw do
  root 'dashboard#index'

  resources :articles,    path: 'artigos'
  resources :authors,     path: 'autores'
  resources :questions,   path: 'questoes'
  resources :users,       path: 'usuarios'

  resources :juridical_reports, path: 'boletim-juridico' do 
    resources :juridical_report_articles, path: 'boletim-artigos'
  end
end
