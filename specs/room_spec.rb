require("minitest/autorun")
require_relative("../room.rb")
require_relative("../song.rb")
require_relative("../guest.rb")

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new(10.00)
    @song1 = Song.new("Make a man out of you")
    @song2 = Song.new("Once upon a Decomber")
    @guest1 = Guest.new("Stuart")
    @guest2 = Guest.new("Sophie")
    @songs1 = [@song1, @song2]
    @guests1 = [@guest1, @guest2]
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

  def test_add_guest
    @room1.add_guest(@guest1)
    assert_equal(1, @room1.occupants().length())
  end

  def test_add_many_guests
    @room1.add_many_guests(@guests1)
    assert_equal(2, @room1.occupants().length())
  end

end
