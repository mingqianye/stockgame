class CreateOperations < ActiveRecord::Migration[5.1]
  def change
    create_table :operations do |t|
      t.string   :game_id,      null: false
      t.string   :open_id,      null: false
      t.string   :tushare_code, null: false
      t.string   :ktype,        null: false
      t.datetime :start_date,   null: false
      t.integer  :num_points,   null: false
      t.string   :op_type,      null: false
      t.integer  :point_index,  null: false
      t.datetime :operated_at,  null: false
      t.timestamps
    end
  end
end
