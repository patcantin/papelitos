class AddCurrentUserToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :current_user, :integer
  end
end
