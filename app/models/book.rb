class Book < ActiveRecord::Base
  belongs_to :poster, :class_name => "User"
  belongs_to :requester, :class_name => "User"

  validates :title, :presence = true
end
