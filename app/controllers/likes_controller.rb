class LikesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]


  def create

    like          = Like.new
    book      = Book.find params[:book_id]
    like.book = book
    like.user = current_user
    if like.save
      redirect_to book_path(book), notice: "Thanks for liking!"
    else
      redirect_to book_path(book), alert: "Can't like! Liked already?"
    end
  end

  def destroy

    book = Book.find params[:book_id]
    like     = current_user.likes.find params[:id]
    like.destroy
    redirect_to book_path(book), notice: "Like removed!"

  end


end
