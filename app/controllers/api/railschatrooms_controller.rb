class Api::RailschatroomsController < ApplicationController

  before_action do
     request.format = :json
   end

  def index
    @railschatrooms = Railschatroom.all


    render json: {railsChatRooms: @railschatrooms}
 end

 def create
   @railschatroom = Railschatroom.new params.require(:railschatroom).permit(:name)
   if @railschatroom.save

     render status: 201, json: @railschatroom
   else
     render status: 442, json: @railschatroom.errors
   end


 end

end
