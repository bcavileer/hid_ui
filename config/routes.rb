HidUi::Engine.routes.draw do
  post 'identify', to: 'Application#identify'
  post 'map', to: 'Application#map'
  post 'delete', to: 'Application#delete'
  post 'clear', to: 'Application#clear'
  root to: 'Application#index'
end
