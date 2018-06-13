Rails.application.routes.draw do
  get 'soccer_player_votings/votes'

  get 'abilities/show'

  get 'players/upsert'
  get 'players/get_open_id'

  get 'shadows/show'

  get 'operation_analysis/show'

  get 'leaderboard/show'
  get 'leaderboard/show_game'

  post 'player_operations/submit'

  get 'ticks/show'
  get 'ticks/find_tushare_codes'

  root to: 'main#index'
end
