class AddSessionTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sessiontoken, :string
  end
end
