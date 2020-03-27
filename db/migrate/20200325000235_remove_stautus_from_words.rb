class RemoveStautusFromWords < ActiveRecord::Migration[6.0]
  def change
    remove_column :game_words, :status, :boolean
  end
end
