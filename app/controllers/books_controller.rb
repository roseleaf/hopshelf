class BooksController < ApplicationController
  # before_filter :get_book, :only => [:edit, :update, :destroy]
  # before_filter :check_auth, :only => [:edit, :update, :destroy]

  # def get_book
  #   @book = Book.find(params[:id])
  # end

  # def check_auth
  #   if session[:user_id] != @book.user_id
  #     flash[:notice] = "Sorry, you can't edit someone else's items"
  #     redirect_to books_path
  #   end
  # end
  def create
    @book = Book.new(params[:book])

    if @book.save
      redirect_to(book_user_path(@book.poster_id), :notice => 'Bookshelf Updated!')
    else
      @user = User.find(@book.poster_id)
      @books = Book.where("(poster_id = ?)", @user.id)
      render :template => 'users/book'
    end
  end

  def index
    # if params[:poster_id]
    #   @user = User.where(:name => params[:poster_id]).first
    #   @books = @user.books
    # end
    @books = Book.where("(poster_id = ?)", @user.id)
    render :template => 'users/book' 
  end

  # def show
  #   @book = Book.find(params[:id])

  #   respond_to do |format|
  #     format.html # show html.erb
  #     format.xml { render :xml => @book }
  #     format.json {render :json => @book}
  # end

  # def edit
  # end
end
