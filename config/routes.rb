Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :wikis

  resources :charges, only: [:new, :create]

  post 'charges/downgrade'

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
