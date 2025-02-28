class ListsController < ApplicationController
  def index
    @lists = List.all
    # raise
  end

  def show
    @bookmarks = Bookmark.all
    @lists = List.find(params[:id])
    @l_array = []

    @bookmarks.each do |bookmark|
      if @lists.id == bookmark.list_id
        @l_array << bookmark.movie
        @bookmark = bookmark.id
      end
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @lists = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
