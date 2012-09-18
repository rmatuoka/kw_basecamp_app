KwBasecapApp::Application.routes.draw do
  
  resources :jobs
  resources :briefings
  resources :users
  resources :dashboard
  resources :timetrack

  root :to => "timetrack#index"

end
