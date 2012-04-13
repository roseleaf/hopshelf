class CommentsController < ApplicationController
  before_filter :get_parent
  before_filter :require_user 

  
  def new
    @comment = @parent.comments.build
  end

  def create
    @comment = @parent.comments.build(params[:comment])
    
    if @comment.save
      redirect_to book_path(@comment.book), :notice => 'Thank you for your comment!'
    else
      render :new
    end
  end

  protected
  
  def get_parent
    @parent = Book.find_by_id(params[:book_id]) if params[:book_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    
    redirect_to root_path unless defined?(@parent)
  end
end
