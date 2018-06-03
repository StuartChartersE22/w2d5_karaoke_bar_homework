require("minitest/autorun")
require_relative("../karaoke_room.rb")
require_relative("../guest.rb")
require_relative("../club.rb")
require_relative("../reception.rb")

class ClubTest < MiniTest::Test

  def setup
    @room1 = KaraokeRoom.new(10.00, 5, "fairytale")
    @room2 = KaraokeRoom.new(15.50, 2, "musical")
    @reception = Reception.new()
    rooms = [@room1, @room2, @reception]

    @guest1 = Guest.new("Stuart", 50.00)
    @guest2 = Guest.new("Sophie", 20.00)
    @guest3 = Guest.new("Joe", 20.00)
    @party1 = [@guest1, @guest2]

    @club1 = Club.new("Da Mic", rooms)
  end

  def test_club_has_name
    assert_equal("Da Mic", @club1.name())
  end

  def test_available_karaoke_rooms
    list_available_rooms = @club1.available_karaoke_rooms(2)
    assert_equal(2, list_available_rooms.length())
  end

  def test_add_array_of_rooms_working_in_initialize
    assert_equal(@club1, @room1.in_club())
  end

end
