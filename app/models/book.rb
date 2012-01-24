class Book < ActiveRecord::Base
  belongs_to :poster, :class_name => "User"
  belongs_to :user
  belongs_to :genre
  validates :title, :presence => true
end