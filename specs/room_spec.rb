require("minitest/autorun")
require_relative("../room.rb")
require_relative("../song.rb")
require_relative("../guest.rb")

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new(10.00, 5)
    @song1 = Song.new("Make a man out of you")
    @song2 = Song.new("Once upon a December")
    @guest1 = Guest.new("Stuart", 50.00)
    @guest2 = Guest.new("Sophie", 20.00)
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

  def test_remove_guest
    @room1.add_guest(@guest1)
    @room1.remove_guest(@guest1)
    assert_equal(0, @room1.occupants().length())
  end

  def test_remove_many_guests
    @room1.add_many_guests(@guests1)
    @room1.remove_many_guests(@guests1)
    assert_equal(0, @room1.occupants().length())
  end

  def test_number_of_spaces_left_in_a_room
    @room1.add_many_guests(@guests1)
    assert_equal(3, @room1.number_of_spaces_left())
  end

end
