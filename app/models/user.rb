class User < ActiveRecord::Base
  has_many :books
  belongs_to :region
  has_many :messages, :as=> :sender
  has_many :messages, :as=> :receiver
  acts_as_authentic


  def active?
    active
  end

  def activate!
    self.active = true
    save
  end

  def deactivate!
    self.active = false
    save
  end

  def send_activation_instructions!
    reset_perishable_token!
    UserMailer.activation_instructions(self).deliver
  end

  def send_activation_confirmation!
    reset_perishable_token!
    UserMailer.activation_confirmation(self).deliver
  end

  def email_address_with_name
    "#{self.name} <#{self.email}>"
  end
end
