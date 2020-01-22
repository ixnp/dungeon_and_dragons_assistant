class AddDmToGames < ActiveRecord::Migration[6.0]
  def change
    add_reference :games, :dm, foreign_key: true
  end
end
