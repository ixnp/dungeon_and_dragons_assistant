class AddConstraintsToUsersName < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :name, :string, limit: 25, null: false

  end
end
