Rails.application.routes.draw do
  resources :stories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/lenny', to: 'stories#accion'
end
