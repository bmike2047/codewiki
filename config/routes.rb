Rails.application.routes.draw do
  devise_for :users
  resources :articles

  get '/articles/:id/prepare_edit', to: 'articles#prepare_edit', :as => :prepare_edit
  #get "articles/prepare_edit", to: redirect(edit_article_path)


end
