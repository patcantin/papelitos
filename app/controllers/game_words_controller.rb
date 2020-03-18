class GameWordsController < ApplicationController
  before_action :set_words, only: [:new]
  def new
  end
  def create
  end

  private

  def set_words
    @game = Game.find(params[:game_id])
  end
end
