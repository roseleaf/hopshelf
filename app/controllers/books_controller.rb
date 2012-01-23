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

  # def new 
  #   @user = User.all
  #   @book = Book.new

  #     respond_to do |format|
  #       format.html # new.html.erb
  #       format.json { render :json => @book }
  #     end
  #   else
  #     redirect_to :root
  #   end
  # end
  def new
    @books = Book.where("(poster_id = ?)", @user.id)
    @users = User.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end 
  end 
    
  def edit
    @book = Book.find(params[:id])

  end

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

  def update
    @book = Book.find(params[:id])   
   
    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html  { redirect_to(book_user_path(@book.poster_id), #maintains user id for path
                      :notice => 'Bookshelf was successfully updated.') }
        # format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @book.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
   
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end



  def index
    # if params[:poster_id]
    #   @user = User.where(:name => params[:poster_id]).first
    #   @books = @user.books
    # end
    @books = Book.where("(poster_id = ?)", user.id)
    # render :template => 'users/:id/book' 
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @posts }
    end
  end

  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show html.erb
      format.xml { render :xml => @book }
      format.json {render :json => @book}
    end
  end

  # def edit
  # end
end