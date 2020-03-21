class GameWordsController < ApplicationController
  before_action :set_words, only: [:new]
  def new
  end

  def create
    @game_word = GameWord.new(game_word_params)
    @game = Game.find(params[:game_id])
    @game_word.game = @game
    @game_word.word = current_word
    if @game_words.save!
      redirect_to game_user_path(@game.id)
    else
      render :new
    end
  end

  private

  def set_words
    @game = Game.find(params[:game_id])
  end

  def game_word_params
    params.permit(:name)
  end
end
