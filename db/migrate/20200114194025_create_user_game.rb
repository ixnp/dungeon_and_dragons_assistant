class CreateUserGame < ActiveRecord::Migration[6.0]
  def change
    create_table :user_games do |t|
      t.integer :game_id
      t.integer :user_id
    end
  end
end
