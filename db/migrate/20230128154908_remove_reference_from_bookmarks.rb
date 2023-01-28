class RemoveReferenceFromBookmarks < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookmarks, :reference, :string
  end
end
