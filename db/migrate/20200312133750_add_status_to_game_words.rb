class AddStatusToGameWords < ActiveRecord::Migration[6.0]
  def change
    add_column :game_words, :status, :boolean
  end
end
