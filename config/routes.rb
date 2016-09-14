Rails.application.routes.draw do
  resources :competences, except: [:show]

  root to: 'competences#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
