class GameTeam < ApplicationRecord
  belongs_to :game

  has_many :game_users
end
