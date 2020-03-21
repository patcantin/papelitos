class RemoveFieldWordIdFromTableGameUser < ActiveRecord::Migration[6.0]
  def change

    remove_column :game_words, :word_id, :bigint
  end
end
