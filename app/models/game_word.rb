class GameWord < ApplicationRecord
  belongs_to :game
  belongs_to :word

  validates_uniqueness_of :game, :scope => [:word]
end
