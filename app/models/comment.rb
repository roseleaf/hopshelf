class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable

  def book
    return @book if defined?(@book)
    @book = commentable.is_a?(Book) ? commentable : commentable.book
  end


end
