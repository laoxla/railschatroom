class RailschatroomsController < ApplicationController


  def index
    @railschatrooms = Railschatroom.all
  end

  def show
  end

  def new
  end
end
