class Book < ActiveRecord::Base
  belongs_to :poster, :class_name => "User"
  belongs_to :user
  belongs_to :genre
  has_many :messages
  validates :title, :presence => true
end