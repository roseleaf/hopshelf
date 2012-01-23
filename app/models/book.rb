class Book < ActiveRecord::Base
  belongs_to :poster, :class_name => "User"
  belongs_to :user
  validates :title, :presence => true
end