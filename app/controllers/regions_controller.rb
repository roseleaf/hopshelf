class RegionsController < ApplicationController
  
  def users
    @region = Region.find(params[:id])

    # @users = User.find(params[:id])
    @users = User.where("(region_id = ?)", @region.id)
    @user = User.new

    respond_to do |format|
      format.html # show html.erb
      format.xml { render :xml => @book }
      format.json {render :json => @book}
    end
  end

  def index
    @users = User.all
    @regions = Region.all
      respond_to do |format|
        format.html # index.html.erb
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @region = Region.find(params[:id])
    @users = User.where("(region_id = ?)", @region.id)
    @regions = Region.all

      respond_to do |format|
        format.html # show.html.erb
    end
  end

end