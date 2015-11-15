Rails.application.routes.draw do
  # get 'diamonds/new'
  
  get 'diamonds/chart' => "diamonds#chart"
  root to: 'diamonds#index'
  resources :diamonds
end
