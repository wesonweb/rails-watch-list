class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[destroy]
  before_action :set_list, only: %i[new create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list # associate the bookmark with the list
    if @bookmark.save # save the bookmark
      redirect_to list_path(@list) # 302
    else
      render :new # 422
    end
  end

  def destroy
    @bookmark.destroy # destroy the bookmark
    redirect_to list_path(@bookmark.list) # 303
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
