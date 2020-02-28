class ChangeRoundNameToBeIntegerInGames < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :round_name
    add_column :games, :round, :integer
  end
end
