class RemoveFieldGameTeamIdFromTableGameUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :game_users, :game_team_id, :integer
  end
end
