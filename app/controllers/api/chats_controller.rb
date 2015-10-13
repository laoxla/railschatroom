class Api::ChatsController < ApplicationController

  #  before_action :authenticate_user!

  before_action do
    request.format = :json
  end

  def index
    @all_users = User.all
    @chats_db = Chat.all.order("posted_at desc").limit(100)
  end

  def create

    puts '*-*-*'*111
    puts params

    @newchat = Chat.new params.require(:chat).permit(:text)
    # set room
    @newchat.railschatroom_id = params[:room_id]
    @newchat.user_id = @current_user.id
    @newchat.posted_at = Time.now

   #  @theroom = Railschatroom.find_by(params[:id])

   #  @theroom.chats << @newchat

    # set user
    # @message.user = User.all.sample
    # if we had auth working
   #  @chats_db.user << @current_user

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
