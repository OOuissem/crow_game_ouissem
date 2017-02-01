Rails.application.routes.draw do

  post 'crop/:id', to: 'fruits#crop', as: 'crop_fruit'

  root 'games#index'

  #get 'games/index'

  # get ':controller/:action/:id/:user_id'
  
  # get ':controller/:action/:id'

  get 'games/show'

  get 'games/:id', to: 'games#show', as: 'game'

  post 'dice/:id', to: 'dice#roll', as: 'roll_dice'

  post 'crow/:id', to: 'crow#step', as: 'crow_step'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end