class Game < ApplicationRecord
  belongs_to :user

  has_many :game_users
  has_many :game_words
  has_many :game_teams

  validates :key_number, uniqueness: true
  enum round: { describe: 1, mime: 2, one_word: 3 }

  before_save :generate_key, :set_round

  private

  def generate_key
    result = rand(1000..9999)
    self.assign_attributes(key_number: result)
  end
  def set_round
    self.assign_attributes(round: 1)
  end
end
