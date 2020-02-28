class GameUser < ApplicationRecord
  belongs_to :game
  belongs_to :user
  belongs_to :game_team
end
