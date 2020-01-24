class AddAuthorToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :author, :string
  end
end
