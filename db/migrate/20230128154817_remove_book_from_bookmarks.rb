class RemoveBookFromBookmarks < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookmarks, :book, :string
  end
end
