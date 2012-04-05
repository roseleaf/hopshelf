class Contact < ActiveRecord::Base
  validates :from_email, :presence => true
  validates :subject, :presence => true
  validates :body, :presence => true
end
