class GameWordsController < ApplicationController
  before_action :set_words, only: [:new]
  def new
  end

  def create
    @game_words = game_words.create title: params[:title]
    if @game_word.save!
      redirect_to update_game_game_teams_path(@game.id)
    else
      render :new
    end
  end

  private

  def set_words
    @game = Game.find(params[:game_id])
  end

  def game_word_params
    params.permit(:game_id, :user_id)
  end
end
