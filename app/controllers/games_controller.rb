class GamesController < ApplicationController
  def index
    @user = current_user
    @game = Game.new
  end
  def create
    @game = Game.new
    @game.user = current_user
    if @game.save!
      redirect_to new_game_game_word_path(@game.id)
    else
      render :index
    end
  end
end
