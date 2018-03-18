Rails.application.routes.draw do
  get 'ticks/show'

  root to: 'main#index'
end
