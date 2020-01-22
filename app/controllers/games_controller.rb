class GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_current_user, only: [:edit, :update, :destroy]

  def new
    @game = Game.new
  end

  def show
    @notable = Game.find(params[:id])
  end

  def edit
  end

  def index
    @games = Game.all
  end

  def destroy
    @game.destroy
    flash[:notice] = "Game removed!"
    redirect_to games_path
  end

  def create
    @game = Game.new(game_params)
    @dm = Dm.new
    
    if @dm.save
      @game.dm_id = @dm.id
      
      if @game.save
        @game.users << current_user
        flash[:notice] = "Let the advanture begin!"
        Rails.logger.debug(@game)
        redirect_to game_path(@game)
      else
        render "new"
      end
    else
      render "new"
    end
  end

  def update
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

  def set_game
    @game = Game.find(params[:id])
  end

  def require_current_user
    if @game.users.find { |item| item[:name] == current_user.name }
      flash[:danger] = "This is not your game, you can only edit or delete the games you've made!"
      redirect_to game_path()
    end
  end
end
