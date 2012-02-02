class Contact < ActiveRecord::Base
  validates :body, :presence => true
end
