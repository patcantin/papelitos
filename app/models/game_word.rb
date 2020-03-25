class GameWord < ApplicationRecord
  belongs_to :game

  enum status: { in: 1, in_play: 2, out: 3 }
end
