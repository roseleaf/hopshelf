class GenresController < ApplicationController
  
  def books
    @genre = Genre.find(params[:id])
    @genres = Genre.all
    # @users = User.find(params[:id])
    @books = Book.where("(genre_id = ?)", @genre.id)
    @book = Book.new

    respond_to do |format|
      format.html # show html.erb
      format.xml { render :xml => @book }
      format.json {render :json => @book}
    end
  end

  def index
    @books = Book.all
    @genres = Genre.all
      respond_to do |format|
        format.html # index.html.erb
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @genre = Genre.find(params[:id])
    @genres = Genre.where("(genre_id = ?)", @genre.id)
    @genres = Genre.all

      respond_to do |format|
        format.html # show.html.erb
    end
  end

end
