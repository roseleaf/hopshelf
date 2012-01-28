class UserMailer < ActionMailer::Base
  default :from => "rose@shelfwire.org"
 
  def welcome_email(user)
    @user = user
    @url  = "http://localhost:3000/login" #Change this when you have a name
    email_with_name = "#{@user.username} <#{@user.email}>"
    mail(:to => email_with_name, :subject => "Welcome to Whiteshelf") do |format|
      format.html
      format.text
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