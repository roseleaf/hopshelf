class User < ActiveRecord::Base
  has_many :books
  belongs_to :region
  acts_as_authentic
end
