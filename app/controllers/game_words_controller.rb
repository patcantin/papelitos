class GameWordsController < ApplicationController
  before_action :set_words, only: [:new]
  def new
  end

  def create
    @game = Game.find(params[:game_id])
    # use create instead of new to automatically save
    # pass in game
    GameWord.create(name: params[:word_1], game: @game)
    GameWord.create(name: params[:word_2], game: @game)
    GameWord.create(name: params[:word_3], game: @game)
    GameWord.create(name: params[:word_4], game: @game)
    GameWord.create(name: params[:word_5], game: @game)

    redirect_to game_game_users_path(@game.id)
    # if @game_words.save!
    #   redirect_to game_game_users_path(@game.id)
    # else
    #   render :new
    # end
  end

  private

  def set_words
    @game = Game.find(params[:game_id])
  end
end
