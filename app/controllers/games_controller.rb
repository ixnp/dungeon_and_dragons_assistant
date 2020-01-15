class GamesController < ApplicationController
  # TODO: finish before_action
  # before_action :set_game, only[:edit,:update,:show,:destroy]
  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.all
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:notice] = "Game removed!"
    redirect_to games_path
  end

  def create
    @game = Game.new(game_params)
    @game.save
    if @game.save
      flash[:notice] = "Let the advanture begin!"
      Rails.logger.debug(@game)
      redirect_to game_path(@game)
    else
      render "new"
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      flash[:notice] = "Your game was updated"
      redirect_to game_path(@game)
    else
      render "edit"
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :summery, :lore, :rules)
  end
  
end
