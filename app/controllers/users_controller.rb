class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  # def edit
  #   @user = User.find(params[:id])
  #   if @user == current_user
  #     render :edit
  #   else
  #     redirect_to user_path(current_user.id)
  #   end
  # end
  
  def edit
    @user = User.find(params[:id])
  end


  def index
    @user = current_user.id
    @users = User.all
    @book = Book.new
  end

  # def update
  #   @user = User.find(params[:id])
  #   @user.update(user_params)
  #   flash[:notice] = "You have updated user successfully."
  #   redirect_to user_path(@user.id)
  # end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update(user_params)
  #     @user.save
  #     flash[:notice] = "You have updated user successfully."
  #     redirect_to user_path(@user.id)
  #   else
  #     render :edit
  #   end
  # end
  
  
  # def update
  #   @user = User.find(params[:id])
  #   @user.update(user_params)
  #   redirect_to user_path(@user.id)
  # end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
  

end
