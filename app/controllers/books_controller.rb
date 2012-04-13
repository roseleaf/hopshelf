class BooksController < ApplicationController
  before_filter :require_user 


  # before_filter :get_book, :only => [:edit, :update, :destroy]
  # before_filter :check_auth, :only => [:edit, :update, :destroy]

  # def get_book
  #   @book = Book.find(params[:id])
  # end



  def new
    @genres = Genre.all
    @books = Book.where("(poster_id = ?)", @user.id)
    @users = User.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end 
  end 

  def message
    @book = Book.find(params[:book])
      @books = Book.all
      # @users = User.find(params[:id])
      @messages = Message.where("(book_id = ?)", @book.id)
      @message = Message.new(params[:message])

    respond_to do |format|
      format.html # show html.erb
      format.xml { render :xml => @message }
      format.json {render :json => @message}
    end
  end
  
      
  def edit
    @book = Book.find(params[:id])

  end

  def create
    @genres = Genre.all
    @book = Book.new(params[:book])

    if @book.save
      redirect_to(user_books_path(@book.poster_id), :notice => 'Bookshelf Updated!')
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
        format.html  { redirect_to(user_books_path(@book.poster_id), #maintains user id for path
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
    redirect_to(user_books_path(@book.poster_id), :notice => 'Bookshelf Updated!')
    # respond_to do |format|
    #   format.html { redirect_to books_url }
    #   format.json { head :no_content }
    # end
  end

  def search
    @books = Book.search params[:search]
  end


  def index
    # if params[:poster_id]
    #   @user = User.where(:name => params[:poster_id]).first
    #   @books = @user.books
    # end
    # @books = Book.find(params[:search])
    if params.include? :search 
      @books= Book..where("name like ?", "%#{params[:search]}%").order(:name)
    else
      @books = Book.where("(poster_id = ?)", user.id)
      # render :template => 'users/:id/book' 
      respond_to do |format|
        format.html  # index.html.erb
        format.json  { render :json => @posts }
      end
    end
  end

  def search
    @books = Book.find(params[:search])
  end   

  def all    
    @books = Book.search(params[:search]).order('accepted desc') 
    
    respond_to do |format|
      format.html { render 'all' }                  # uses the same view as the default index
      format.xml  { render :xml => @books }
    end
  end

  def show
    if params.include? :search 
      @book= Book.where("title like ?", "%#{params[:search]}%").order(:title)
    else
      @book = Book.find(params[:id])
      @comments = Comment.all
      @comment = Comment.where("book_id = ?", @book.id)
    

      respond_to do |format|
        format.html # show html.erb
        format.xml { render :xml => @book }
        format.json {render :json => @book}
      end
    end
  end



  # def edit
  # end
end