class CreateTicks < ActiveRecord::Migration[5.1]
  def change
    create_table :ticks do |t|
      t.string   :tushare_code, null: false
      t.string   :share_name,   null: false
      t.string   :ktype,        null: false
      t.datetime :date,         null: false
      t.float    :open,         null: false
      t.float    :close,        null: false
      t.float    :high,         null: false
      t.float    :low,          null: false
      t.float    :volume,       null: false
      t.timestamps
    end
  end
end
