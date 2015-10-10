require "test_helper"

class RailschatroomTest < ActiveSupport::TestCase
  def railschatroom
    @railschatroom ||= Railschatroom.new
  end

  def test_valid
    assert railschatroom.valid?
  end
end
