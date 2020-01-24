class AddConstraintToUserSessiontoken < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :sessiontoken, :string
    add_index :users, :sessiontoken, unique: true
  end
end
