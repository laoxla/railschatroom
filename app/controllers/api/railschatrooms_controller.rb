class Api::RailschatroomsController < ApplicationController

  before_action do
     request.format = :json
   end

  def index
    @railschatrooms = Railschatroom.all


   render json: {railsChatRooms: @railschatrooms}
 end

end
