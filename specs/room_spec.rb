require("minitest/autorun")
require_relative("../room.rb")

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new(3)
  end

  def test_has_a_capacity
    assert_equal(3, @room1.capacity())
  end

end
