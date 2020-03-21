class GameWord < ApplicationRecord
  belongs_to :game

  validates_uniqueness_of :game, :scope => [:word]
end
