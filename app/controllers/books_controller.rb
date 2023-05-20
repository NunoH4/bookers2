class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  # def create
  #   @book = Book.new(book_params)
  #   @book.user_id = current_user.id
  #   @book.save
  #   flash[:notice] = "You have created book successfully."
  #   redirect_to books_path
  # end
  
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to books_path
    else
      @books = Book.all
      @user = current_user.id
      render :index
    end
  end
  
  
  def edit
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      render :edit
    else
      redirect_to books_path
    end
  end
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user.id
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user.id
    @book_post = Book.new

  end

  # def update
  #   @book = Book.find(params[:id])
  #   @book.update(book_params)
  #   flash[:notice] = "You have updated book successfully."
  #   redirect_to book_path(@book.id)
  # end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      @book.save
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  
  

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

   private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
