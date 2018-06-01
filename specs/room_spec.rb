require("minitest/autorun")
require_relative("../room.rb")

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new(10.00)
  end

  def test_room_has_price
    assert_equal(10.00, @room1.price())
  end

end
