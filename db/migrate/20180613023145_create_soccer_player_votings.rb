class CreateSoccerPlayerVotings < ActiveRecord::Migration[5.1]
  def change
    create_table :soccer_player_votings do |t|
      t.text :votes

      t.timestamps
    end
  end
end
