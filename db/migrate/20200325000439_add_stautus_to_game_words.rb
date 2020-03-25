class AddStautusToGameWords < ActiveRecord::Migration[6.0]
  def change
    add_column :game_words, :status, :integer
  end
end
