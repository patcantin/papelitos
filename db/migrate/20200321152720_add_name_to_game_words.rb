class AddNameToGameWords < ActiveRecord::Migration[6.0]
  def change
    add_column :game_words, :name, :string
  end
end
