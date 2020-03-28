class GameTeamsController < ApplicationController
  def update
    @game_team = GameTeam.find(params[:id])
    @game_team.score += 1
    @game_team.save
    # redirect_to game_path(@game_team.game)
  end
end
