class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  # def book
  #   @user = User.find(params[:id])
  #   @books = Book.where("(poster_id =?)", @user.id)
  #   @book = Book.new
  # end

  def index
    @books = Book.all
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @books = Book.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  def books
    @user = User.find(params[:id])
    @genre = Genre.all

    # @books = Book.find(params[:id])
    @books = Book.where("(poster_id = ?)", @user.id)
    @book = Book.new

    respond_to do |format|
      format.html # show html.erb
      format.xml { render :xml => @book }
      format.json {render :json => @book}
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new 
    @regions = Region.all
    if !current_user || is_admin?
      @user = User.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @user }
      end
    else
      redirect_to :root
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])

    if is_me? params[:id] || is_admin?
      #
    else
      redirect_to @user
    end
  end
  # POST /users
  # POST /users.json
  def create
    if !current_user || is_admin?
      @user = User.new(params[:user])

      respond_to do |format|
        if @user.save
          format.html { redirect_to(:root, :notice => 'Registration successfull.') }
          #format.xml  { render :xml => @user, :status => :created, :location => @user }
        else
          format.html { render :action => "new" }
          #format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    else
      redirect_to :root
    end
  end
  

  # PUT /users/1
  # PUT /users/1.json
  def update
    if is_me? params[:id] || is_admin?
      @user = User.find(params[:id])

      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to @user, :notice => 'User was successfully updated.' }
          #format.json { head :ok }
        else
          format.html { render :action => "edit" }
          #format.json { render :json => @user.errors, :status => :unprocessable_entity }
        end
      end
    else
      redirect_to :root
    end
  end
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])

    if is_admin
      @user.destroy

      respond_to do |format|
        format.html { redirect_to users_url }
        #format.json { head :ok }
      end
    else
      redirect_to @user
    end      
  end
end