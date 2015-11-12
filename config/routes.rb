Rails.application.routes.draw do
  # get 'diamonds/new'
  root to: 'diamonds#index'
  resources :diamonds
end
