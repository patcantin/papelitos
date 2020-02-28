class CreateGameTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :game_teams do |t|
      t.references :game, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
