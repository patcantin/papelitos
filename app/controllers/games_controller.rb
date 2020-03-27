class GamesController < ApplicationController
  def index
    @user = current_user
    @game = Game.new
    @game_user = GameUser.new
  end
  def create
    @game = Game.new(user: current_user)
    if @game.save
      @game_user = GameUser.new(user: current_user, game: @game) # assign current user to game
      2.times { GameTeam.create!(game: @game, score: 0) } # create 2 teams associated to this game
      @game_user.game_team = @game.game_teams.first
      if @game_user.save
        redirect_to new_game_game_word_path(@game.id)
      end
    end
  end
  def show
    @game = Game.find(params[:id])
    @game_users = GameUser.all
    @game_words = GameWord.all
    @game_teams = GameTeam.all
  end

end
