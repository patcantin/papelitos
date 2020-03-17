class GamesController < ApplicationController
  def index
    @user = current_user
    @game = Game.new
  end
  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save!
      redirect_to index_path
    else
      render :index
    end
  end

  private

  def game_params
    params.require(:game).permit(:key_number, :user_id)
  end
end
