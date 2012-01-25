class User < ActiveRecord::Base
  has_many :books
  belongs_to :region
  acts_as_authentic
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
