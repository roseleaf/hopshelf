class Book < ActiveRecord::Base
  belongs_to :poster, :class_name => "User"
  belongs_to :user
  belongs_to :genre
  has_many :messages
  has_many :comments, :as => :commentable
  validates :title, :presence => true

  # def self.search(search)
  #   search_condition = "%" + search + "%"
  #   find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
  # end

  # def self.search(search)
  #   if search
  #     find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  #   else
  #     find(:all)
  #   end
  # end

# def self.search(search) 
#   if search 
#     where('title LIKE ? or author LIKE ?', "%#{search}%", "%#{search}%") 
#   else 
#     scoped 
#   end 
# end


end