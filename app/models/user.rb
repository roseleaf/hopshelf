class User < ActiveRecord::Base
  has_many :books
  acts_as_authentic
end
