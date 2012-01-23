class RegionsController < ApplicationController
  
    def index
      # @users = User.find(params[:id])
      @regions = Region.all
        respond_to do |format|
        format.html # index.html.erb
      end
    end

    # GET /users/1
    # GET /users/1.json
    def show
      # @users = User.find(params[:id])
      @regions = Region.all

      respond_to do |format|
        format.html # show.html.erb
      end
    end

end