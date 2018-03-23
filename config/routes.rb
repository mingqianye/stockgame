Rails.application.routes.draw do
  get 'leaderboard/show'

  post 'player_operations/submit'

  get 'ticks/show'
  get 'ticks/find_tushare_codes'

  root to: 'main#index'
end
