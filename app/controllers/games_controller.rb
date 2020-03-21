class GamesController < ApplicationController
  before_action :set_game, only: [:new]
  def index
    @user = current_user
    @game = Game.new
    @game_user = GameUser.new
  end
  def create
    @game = Game.new(user: current_user)
    if @game.save
      game_user = GameUser.new(user: current_user, game: @game) # assign current user to game
      if game_user.save
        2.times { GameTeam.create!(game: @game) } # create 2 teams associated to this game
        redirect_to new_game_game_word_path(@game.id)
      end
    end

    def show
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end
end










