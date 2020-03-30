class RemoveGameUserIdFromGames < ActiveRecord::Migration[6.0]
  def change
    remove_reference :games, :game_user, null: false, foreign_key: true
  end
end
