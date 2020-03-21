class GameUsersController < ApplicationController
  def index
    # @game_users = GameUser.all
    @game = Game.find(params[:game_id])
    @game_users = @game.game_users
    @game_user = current_user.id
  end

  def create
    @game_user = GameUser.new
    @game = Game.find_by_key_number(params[:key_number])
    @game_user.game = @game
    @game_user.user = current_user
    if @game_user.save
      redirect_to new_game_game_word_path(@game.id)
    else
      redirect_to root_path, flash: { alo: "Player already joined!" }
    end
  end
end
