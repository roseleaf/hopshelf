class Book < ActiveRecord::Base
  belongs_to :poster, :class_name => "User"
  belongs_to :user
  belongs_to :genre
  has_many :messages
  has_many :comments, :as => :commentable
  validates :title, :presence => true
end