class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy]
  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new # create a new list
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list) # 302
    else
      render :new, status: :unprocessable_entity # 422
    end
  end

  def destroy
    @list.destroy # destroy the list
    redirect_to lists_path, status: :see_other  # 303
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
