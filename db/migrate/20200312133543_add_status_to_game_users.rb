class AddStatusToGameUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :game_users, :status, :boolean
  end
end
