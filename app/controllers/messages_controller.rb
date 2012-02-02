class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def book
    @books=Book.all
    @book=Book.find(params[:id])
  end

  def index
    # @message = Message.find(params[:id])
    # @user=User.find(params[:receiver_id])
    @messages = Message.where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)", current_user.id, @user.id, @user.id, current_user.id)
    # render :template => '/' #, message_user_path(@message.receiver_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])
    @book = Book.find_by_id(:book_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new
    @books = Book.find(params[:id])
    @book = Book.find_by_id(:book_id)


    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    @books = Book.find_by_id(:id)
    @book = Book.find_by_id(:book_id)
    # @user = User.find_by_id(:poster_id)

    # respond_to do |format|
    if @message.save
      UserMailer.new_message(@message).deliver
      redirect_to('/', :notice => 'Message sent!')
    else
      # @user = User.find(@message.receiverId)
      @messages = Message.where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)", current_user.id, @user.id, @user.id, current_user.id)
      render :template => message_user_path(@message.receiver_id)
      
    end
    
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, :notice => 'Message was successfully set.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
