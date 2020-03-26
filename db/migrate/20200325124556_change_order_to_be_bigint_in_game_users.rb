class ChangeOrderToBeBigintInGameUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :game_users, :order, :bigint
  end
end
