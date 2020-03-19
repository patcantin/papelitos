class GameUsersController < ApplicationController
  before_action :set_game, only: [:new]
  def new
    @games = Game.all
    @game_user = GameUser.new
  end
  def create
    @game_user = GameUser.new(game_user_params)
    @game = Game.find(params[:game_id])
    @game_user.game = @game
    @game_user.user = current_user
    if @game_user.save!
      redirect_to new_game_game_word_path(@game.id)
    else
      render :new
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def game_user_params
    params.permit(:game_id, :user_id)
  end
end
