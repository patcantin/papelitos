class GameTeamsController < ApplicationController
  def update
    @game_team = GameTeam.find(params[:id])
    @game_team.score += 1
    @game_team.save
    redirect_to game_path(@game_team.game)
    # @bus.update(name: params[:bus][:name], capacity: params[:bus][:capacity], description: params[:bus][:description], price: params[:bus][:price], photo: params[:bus][:photo])
    # redirect_to dashboard_path
  end
end
