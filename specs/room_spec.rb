require("minitest/autorun")
require_relative("../room.rb")
require_relative("../song.rb")

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new(10.00)
    @song1 = Song.new("Make a man out of you")
  end

  def test_room_has_price
    assert_equal(10.00, @room1.price())
  end

  def test_add_song
    @room1.test_add_song(@song1)
    assert_equal(1, @room1.songs().length())
  end

end
