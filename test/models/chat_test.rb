require "test_helper"

class ChatTest < ActiveSupport::TestCase
  def chat
    @chat ||= Chat.new
  end

  def test_valid
    assert chat.valid?
  end
end
