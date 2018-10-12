Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :wikis

  resources :charges, only: [:new, :create]

  post 'charges/downgrade'

  post 'wikis/add_collaborators'

  post 'wikis/remove_collaborators'

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
