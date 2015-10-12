class RailschatroomsController < ApplicationController


  def index
    @users = User.all
    @railsrooms = Railschatroom.all
  end

  def show
  end

  def new
  end
end
