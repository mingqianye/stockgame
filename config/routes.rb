Rails.application.routes.draw do
  post 'player_operations/submit'

  get 'ticks/show'

  root to: 'main#index'
end
