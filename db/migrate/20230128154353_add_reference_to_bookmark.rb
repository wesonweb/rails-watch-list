class AddReferenceToBookmark < ActiveRecord::Migration[7.0]
  def change
    add_column :bookmarks, :reference, :string
    add_column :bookmarks, :book, :string
  end
end
