class CreateCharacterSheets < ActiveRecord::Migration[6.0]
  def change
    create_table :character_sheets do |t|
      t.string :name
      t.text :bio
      t.text :stats
      t.string :img
      t.timestamps
    end
  end
end
