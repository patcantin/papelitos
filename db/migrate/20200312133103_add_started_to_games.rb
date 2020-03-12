class AddStartedToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :started, :boolean
    add_column :games, :finished, :boolean
  end
end
