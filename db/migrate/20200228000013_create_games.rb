class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :key_number
      t.string :round_name

      t.timestamps
    end
  end
end
