class BookmarksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)

    if @bookmark.save
      redirect_to @list, notice: "Film ajouté avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to @bookmark.list, notice: 'Film retiré de la liste !'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
