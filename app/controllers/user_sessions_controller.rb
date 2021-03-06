class UserSessionsController < ApplicationController
  #skip_after_filter :store_location
  skip_before_filter :create_login_user, :only => :destroy
  
  # GET /user_sessions/new
  # GET /user_sessions/new.xml
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end

  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        format.html { redirect_back_or_to(:root) }
        format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  def forgot_password
    if current_user
      redirect_to edit_user_path(current_user)
    end
  end

def forgot_password_lookup_email
  if current_user
    redirect_to edit_user_path(current_user)
  else
    user = User.find_by_email(params[:email])
    if user
      user.send_forgot_password!
      flash[:notice] = "A link to reset your password has been mailed to you."
    else
      flash[:notice] = "Email #{params[:email]} wasn't found.  Perhaps you used a different one?  Or never registered or something?"
      render :action => :forgot_password
    end
  end
end
  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    @user_session = UserSession.find
    @user_session.destroy

    respond_to do |format|
      format.html { redirect_to(:root) }
      format.xml  { head :ok }
    end
  end
end