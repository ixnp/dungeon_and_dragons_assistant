class CreateDms < ActiveRecord::Migration[6.0]
  def change
    create_table :dms do |t|
      t.text :notes
      t.timestamps
    end
  end
end
