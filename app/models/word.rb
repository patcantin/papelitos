class Word < ApplicationRecord
  has_many :game_words

  validates :name, uniqueness: true
end
