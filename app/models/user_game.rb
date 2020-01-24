class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def self.find_user_games(user)
    @userGameArr = []
    UserGame.all.map{|game| 
      if game.user_id == user.id
       game =  Game.find(game.game_id)
      if game.dm_id == user.id
        game.dm_id = true
      end 
        @userGameArr.push(game)
      end
      }
      return @userGameArr 
  end 
  
end
