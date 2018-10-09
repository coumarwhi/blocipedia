Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :wikis

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
