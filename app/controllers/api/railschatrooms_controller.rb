class Api::RailschatroomsController < ApplicationController

  before_action do
     request.format = :json
   end

  def index
    @railschatrooms = Railschatroom.all


    render json: {railsChatRooms: @railschatrooms}
 end

 def create
   puts '*-*-*'*111
   puts params

   @newchat = Chat.new params.require(:chat).permit(:text)
   # set room
   @newchat.railschatroom_id = params[:room_id]
   @newchat.user_id = @current_user.id
   @newchat.posted_at = Time.now

   @theroom = Railschatroom.find_by(params[:id])

   @theroom.chats << @newchat

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
