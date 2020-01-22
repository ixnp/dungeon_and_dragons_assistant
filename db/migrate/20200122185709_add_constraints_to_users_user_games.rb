class AddConstraintsToUsersUserGames < ActiveRecord::Migration[6.0]
  def change
    change_column :user_games, :game_id, :integer, null:false
    change_column :user_games, :user_id, :integer, null:false
  end
end
