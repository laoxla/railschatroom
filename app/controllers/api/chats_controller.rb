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

    # NOTE: moved to api/railschatroom_controller.rb

    @newchat = Chat.new params.require(:chat).permit(:text)
    # set room
    @newchat.railsChatRoom = Railschatroom.find params[:room_id]
    # set user
    # @message.user = User.all.sample
    # if we had auth working
    @newchat.user = @current_user

    puts '*-*-*'*111
    pp @newchat
    pp @message

    if @newchat.save
      render status: 201, json: @newchat
    else
      render status: 422, json: @newchat.errors
    end
  end

end
