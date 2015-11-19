class FavouritesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]


  def create
    fav      = current_user.favourites.new
    book     = Book.find params[:book_id]
    # fav.user     = current_user
    fav.book = book
    if fav.save
      redirect_to book_path(book), notice: "Favourited!"
    else
      redirect_to book_path(book), alert: "Error!"
    end
  end

  def destroy
    book = Book.find params[:book_id]
    fav      = current_user.favourites.find params[:id]
    fav.destroy
    redirect_to book_path(book), notice: "UnFavourited!"
  end

end
