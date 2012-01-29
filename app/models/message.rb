class Message < ActiveRecord::Base
    belongs_to :sender, :class_name => "User"
    belongs_to :reciever, :class_name => "User"
    belongs_to :book, :class_name => "Book"
    validates :text, :presence => true
end