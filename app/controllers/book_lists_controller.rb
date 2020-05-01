class BookListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = current_user.books
  end
end
