class RailschatroomsController < ApplicationController

  before_action :authenticate_user!


  def index
    @users = User.where("id != ?", @current_user.id)
    @railsrooms = Railschatroom.all
  end

  def show
  end

  def new
  end
end
