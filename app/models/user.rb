class User < ActiveRecord::Base
  has_many :books
  belongs_to :region
  has_many :messages, :as=> :sender
  has_many :messages, :as=> :receiver
  acts_as_authentic
end
