class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.save
      UserMailer.contact_email(@contact).deliver
      redirect_to('/', :notice => 'Message sent! Thank you for your feedback.')
    else
      render :template => user_path(current_user)
    end
  end
end
