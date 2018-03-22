Rails.application.routes.draw do
  post 'player_operations/submit'

  get 'ticks/show'
  get 'ticks/find_tushare_codes'

  root to: 'main#index'
end
