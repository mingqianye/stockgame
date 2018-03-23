class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :open_id
      t.string :union_id
      t.string :nick_name
      t.string :avatar_url
      t.string :gender
      t.string :city
      t.string :province
      t.string :country
      t.string :language
      t.timestamps
    end
  end
end
