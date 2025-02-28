class ListsController < ApplicationController
  def index
    @bookmarks = Bookmark.all
    @lists = List.all
    @movies = Movie.all
    # raise
    @l_arrays = []
    @m_arrays = []

    @bookmark = @bookmarks.where(id: true).take
    @list = @lists.where(id: true).take
    @movie = @movies.where(id: true).take

    if @bookmark.list_id == @list.id
      @l_arrays << @list
    end

    if @bookmark.movie_id == @movie.id
       @m_arrays << @movie
    end
  end
end
