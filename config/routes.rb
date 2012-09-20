KwBasecapApp::Application.routes.draw do
  
  resources :jobs
  resources :briefings
  resources :users
  resources :dashboard
  resources :timetrack
  resources :import
  
  root :to => "timetrack#index"

end
