class GamesController < ApplicationController
    def new
        @game = Game.new
    end
    
    def create 
        @game = Game.new
        @game.save
        if @game.save
        flash[:notice] = "Let the advanture begin!"
        redirect_to games_show(@game)
        else 
            render 'new'
        end
    end
    private
    def game_params
        params.require(:game).permit(:title,:lore,:rules)
    end
end