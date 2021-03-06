class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer  :player_id,       null: false
      t.float    :portfolio_value, null: false, default: 0
      t.string   :ktype,           null: false
      t.integer  :num_points,      null: false
      t.datetime :start_date,      null: false
      t.string   :tushare_code,    null: false
      t.timestamps
    end
  end
end
