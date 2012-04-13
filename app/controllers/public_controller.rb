class PublicController < ApplicationController
  def index
    @regions = Region.all
  end
  def about
  end

  def page
    @page = params[:page]
  end



end
