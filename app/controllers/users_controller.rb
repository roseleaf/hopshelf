class UsersController < ApplicationController
  before_filter :require_user, :only=> [:message, :books, :show]


  def index
    @books = Book.all
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  def message
    # we save the user in this variable (we get the user ID from the URL (the route))
    @user = User.find(params[:id])

    # Then we write this query to get all the messages sent between user A and B, 
    @messages = Message.where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)", current_user.id, @user.id, @user.id, current_user.id)
    @message = Message.new
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
    @user = User.find(params[:user_id])
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



# app/controllers/users_controller.rb
# new create method:
def create
  @user = User.new(params[:user])

  if @user.save
    UserMailer.activation_instructions(@user).deliver
    flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions! You may close this window and follor the link in your email to sign in."
    redirect_to root_url
  else
    flash[:notice] = "There was a problem creating the user account"
    render :action => :new
  end
end

def activate
  @user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise Exception)
  
  raise Exception if @user.active?
  
  if @user.activate!
    UserSession.create(@user, false)
    @user.send_activation_confirmation!
    redirect_to :root
  else
    render :action => :new
  end
end

def reset_password
  @user = User.find_using_perishable_token(params[:reset_password_code], 1.week) || (raise Exception)
end

def reset_password_submit
  @user = User.find_using_perishable_token(params[:reset_password_code], 1.week) || (raise Exception)
  @user.active = true
  if @user.update_attributes(params[:user].merge({:active => true}))
    flash[:notice] = "Successfully reset password."
    redirect_to @user
  else
    flash[:notice] = "There was a problem resetting your password."
    render :action => :reset_password
  end
end

    # if !current_user || is_admin?
    #   @user = User.new(params[:user])

    #   respond_to do |format|
    #     if @user.save
    #       UserMailer.welcome_email(@user).deliver
    #       format.html { redirect_to(:root, :notice => 'Registration successful.') }
    #       #format.xml  { render :xml => @user, :status => :created, :location => @user }
    #     else
    #       format.html { render :action => "new" }
    #       format.json { render :json => @user.errors, :status => :unprocessable_entity }
    #       #format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
    #     end
    #   end
    # else
  #     redirect_to :root
  #   end
  # end
  

  # PUT /users/1
  # PUT /users/1.json
  def update
    if is_me? params[:id] || is_admin?
      @user = User.find(params[:id])

      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to user_books_path(@user), :notice => 'User was successfully updated.' }
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