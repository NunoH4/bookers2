class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    # ↓ホームに飛ばすよう後で変更する
    redirect_to books_path
  end

  def index
    @book = Book.new
  end

  def show
  end


   private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
