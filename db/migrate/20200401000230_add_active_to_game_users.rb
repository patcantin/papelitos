class AddActiveToGameUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :game_users, :active, :boolean, default: false
  end
end
