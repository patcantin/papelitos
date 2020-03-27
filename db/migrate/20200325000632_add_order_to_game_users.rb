class AddOrderToGameUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :game_users, :order, :integer
  end
end
