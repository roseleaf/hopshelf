class UserMailer < ActionMailer::Base
  default :from => "Shelfwire <rose@shelfwire.org>"
 


  def activation_instructions(user)
    @user = user    
    @account_activation_url = activate_account_url(user.perishable_token)
    email_with_name = "#{@user.username} <#{@user.email}>"
    mail(:to => email_with_name, :subject => "Activate your account!") do |format|
      format.text
    end
  end

  def activation_confirmation(user)
    @user = user    
    @account_activation_url = activate_account_url(user.perishable_token)
    # @url = activate_account_url(user.perishable_token)
    email_with_name = "#{@user.username} <#{@user.email}>"
    mail(:to => email_with_name, :subject => "Success! You're in at Shelfwire") do |format| 
      format.html
    end
  end

  def forgot_password(user)  
    @reset_password_link = reset_password_url(user.perishable_token)
    @user = user    
    @account_activation_url = activate_account_url(user.perishable_token)
    email_with_name = "#{@user.username} <#{@user.email}>"
    mail(:to => email_with_name, :subject => "It's ok, you can reset your password!") do |format|
      format.text
    end

  rescue Timeout::Error
    return false
    
  end

  def password_reset_instructions(user)  
    subject       "Password Reset Instructions"  
    recipients    user.email  
    sent_on       Time.now  
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)  
  end  

  def new_message(message)
    @message = message
    @url  = "http://shelfwire.org/messages" 
    @sendername = @message.sender.username.capitalize
    @toname = @message.receiver.username.capitalize
    if message.book.present?
      @bookname = message.book.title
    end
    email_with_name = "#{@message.receiver.username} <#{@message.receiver.email}>"
    mail(:to => email_with_name, :subject => "You have a new Message on Shelfwire!") do |format|
      format.html
    end
  end

  def new_comment(comment)
    @comment = comment
    @url  = "http://shelfwire.org/login" 
    email_with_name = "#{@message.receiver.username} <#{@message.receiver.email}>"
    mail(:to => email_with_name, :subject => "You have a new comment on Shelfwire") do |format|
      format.html
      format.text
    end
  end

  def contact_email(contact)
    @contact = contact
    @url = "http:shelfwire.org/contact"
    email = "roseleaf.red@gmail.com"
    mail(:to => email, :subject => "Someone on Shelfwire has something to say") do |format|
      format.html
    end
  end

  def receive(email)
    page = Page.find_by_address(email.to.first)
    page.emails.create(
      :subject => email.subject,
      :body => email.body
    )
 
    if email.has_attachments?
      email.attachments.each do |attachment|
        page.attachments.create({
          :file => attachment,
          :description => email.subject
        })
      end
    end
  end

end
  #see config/application.rb line 49 ish to set host/name there as well