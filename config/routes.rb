Rails.application.routes.draw do
  resources :stories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/lenny', to: 'stories#accion'
  get '/yes-no', to: 'stories#decidir'
  get '/alguien-tiene-gemfile', to: 'stories#alguien'
  get '/estimar-historia', to: 'stories#estimar'
end
