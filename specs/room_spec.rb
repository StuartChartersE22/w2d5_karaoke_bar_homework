require("minitest/autorun")
require_relative("../room.rb")
require_relative("../song.rb")

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new(10.00)
    @song1 = Song.new("Make a man out of you")
    @song2 = Song.new("Once upon a Decomber")
    @songs1 = [@song1, @song2]
  end

  def test_room_has_price
    assert_equal(10.00, @room1.price())
  end

  def test_add_song
    @room1.add_song(@song1)
    assert_equal(1, @room1.songs().length())
  end

  def test_add_many_songs
    @room1.add_many_songs(@songs1)
    assert_equal(2, @room1.songs().length())
  end

end
