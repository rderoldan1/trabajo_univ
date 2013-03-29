TrabajoUniv::Application.routes.draw do
  resources :definicions
  root :to => 'definicions#show#1'
end
