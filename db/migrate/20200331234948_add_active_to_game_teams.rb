class AddActiveToGameTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :game_teams, :active, :boolean, default: false
  end
end
