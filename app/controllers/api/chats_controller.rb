class Api::ChatsController < ApplicationController

  #  before_action :authenticate_user!

  before_action do
    request.format = :json
  end

  def index
    @all_users = User.all
    @chats_db = Chat.all.limit(100)
  end

  def create
    @chats_db = Chat.new params.require(:chat).permit(:text)
    # set room
    @chats_db.railsChatRoom = Railschatroom.find params[:id]
    # set user
    # @message.user = User.all.sample
    # if we had auth working
    @chats_db.user = @current_user
    if @message.save
      render status: 201, json: @chats_db
    else
      render status: 422, json: @chats_db.errors
    end
  end

end
