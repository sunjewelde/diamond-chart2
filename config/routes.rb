Rails.application.routes.draw do
  get 'tables/index'

  # get 'diamonds/new'
  
  get 'diamonds/chart' => "diamonds#chart"
  root to: 'diamonds#index'

  resources :diamonds do
  	collection do
  		post :import
  	end
  end
  
end
