class BooksController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :authorize, only: [:new, :create]

  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @authors = Author.all
    @genres = Genre.all
    @book = Book.new
  end

  def create
    @authors = Author.all
    @genres = Genre.all
    @book = Book.new(book_params)
    @book.picture.attach(params[:book][:picture])
    if @book.save
      redirect_to book_path(@book)
    else
      flash[:alert] = @book.errors.full_messages.join()
      render "new"
    end
  end

  private

  def authorize
    if !current_user.has_role?(:admin)
      flash[:alert] = "You are not authorized!"
      redirect_to root_path
    end
  end

  def book_params
    params.require(:book).permit(:title, :author_id, :genre_ids => [])
  end
end
