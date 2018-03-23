class CreateOperations < ActiveRecord::Migration[5.1]
  def change
    create_table :operations do |t|
      t.integer  :game_id, null: false
      t.string   :op_type, null: false
      t.integer  :tick_id, null: false
      t.timestamps
    end
  end
end
