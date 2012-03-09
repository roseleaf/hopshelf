class PublicController < ApplicationController
  def index

  end
  def about
  end

  def page
    @page = params[:page]
  end

end
