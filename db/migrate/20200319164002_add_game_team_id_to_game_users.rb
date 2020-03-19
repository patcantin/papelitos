class AddGameTeamIdToGameUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :game_users, :game_team_id, :bigint
  end
end
