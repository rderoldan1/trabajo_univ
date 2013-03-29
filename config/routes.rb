TrabajoUniv::Application.routes.draw do
  resources :definicions
  root :to => 'definicions#index'
end
