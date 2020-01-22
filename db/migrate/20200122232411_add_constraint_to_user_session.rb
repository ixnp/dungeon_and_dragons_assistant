class AddConstraintToUserSession < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :sessiontoken, unique: true
  end
end
