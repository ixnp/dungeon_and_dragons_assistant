class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.text :note
      t.timestamps
    end
  end
end
