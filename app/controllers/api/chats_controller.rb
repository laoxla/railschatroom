class Api::ChatsController < ApplicationController

  before_action do
    request.format = :json
  end

  def index
    @all_users = User.all
    @chats_db = Chat.all.limit(100)
  end
end
