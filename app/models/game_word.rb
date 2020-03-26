class GameWord < ApplicationRecord
  belongs_to :game

  enum status: { in: 1, in_play: 2, out: 3 }

  before_save :set_status

  private

  def set_status
    self.assign_attributes(status: 1)
  end
end
