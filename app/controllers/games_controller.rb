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
    respond_to do |format|
      # if the browser requested HTML then render HTML response -> app/views/games/show.html.erb
      format.html do
        @game_users = @game.generate_players_array
        @game_words = @game.generate_words_array
        @game_teams = GameTeam.all
      end
      # if the browser requested JSON then send back JSON
      format.json do
        # game_current_user = User.find(@game.current_user)
        # current_word  = @game.game_words.find_by(status: :in)
        team_1_score = @game.game_teams.first.score
        team_2_score = @game.game_teams.last.score
        round_now = @game.round
        who_play = @game.game_users.first.user.name
        playing_now = @game.game_users.first.user.name
        team_playing = @game.game_users.first.game_team_id

        render json: {
          # current_word: current_word.name,
          team_playing: team_playing,
          who_is_playing: who_play,
          you_are_playing: playing_now,
          seconds_left: "",
          team_1_points: team_1_score,
          team_2_points: team_2_score,
          round_name: round_now
        }
      end
    end
  end
end
