class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.timestamps
    end
  end

  def AddCommentToBookmarks
    add_column :bookmarks, :comment, :string
  end
end
