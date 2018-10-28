Rails.application.routes.draw do
  devise_for :users
  resources :articles


  post '/articles/search', to: 'articles#search'

  root "articles#index"

end
