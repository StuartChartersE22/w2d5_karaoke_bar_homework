require("minitest/autorun")
require_relative("../club.rb")
require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../karaoke_room.rb")
require_relative("../reception.rb")

class ReceptionTest < MiniTest::Test

  def setup
    background_song = Song.new("Elevator Jazz")
    @reception = Reception.new(background_song)
    @room1 = KaraokeRoom.new(10.00, 5, "fairytale")
    @room2 = KaraokeRoom.new(15.50, 2, "musical")
    rooms = [@room1, @room2, @reception]

    @guest1 = Guest.new("Stuart", 50.00)
    @guest2 = Guest.new("Sophie", 20.00)
    @guest3 = Guest.new("Joe", 20.00)
    @party1 = [@guest1, @guest2]

    club1 = Club.new("Da Mic", rooms, @reception)

  end

  def test_add_to_till
    @reception.add_cash(10.00)
    assert_equal(10.00, @reception.till())
  end

  def test_admit_guest_to_room__sufficient_space_and_funds
    @reception.admit_guest_to_room("fairytale", @guest1)
    assert_equal(4, @room1.number_of_spaces_left())
    assert_equal(40.00, @guest1.wallet())
    assert_equal(10.00, @reception.till())
    assert_equal(@room1, @guest1.in_room())
    assert_equal(0, @reception.occupants().length())
  end

  def test_admit_guest_to_room__insufficient_space_and_sufficient_funds
    @room2.add_party(@party1)
    @reception.admit_guest_to_room("musical", @guest3)
    assert_equal(0, @room2.number_of_spaces_left())
    assert_equal(20.00, @guest3.wallet())
    assert_equal(0.00, @reception.till())
  end

  def test_admit_guest_to_room__sufficient_space_and_insufficient_funds
    @room1.add_party(@party1)
    @guest3.remove_cash(15.50)
    @reception.admit_guest_to_room("fairytale", @guest3)
    assert_equal(3, @room1.number_of_spaces_left())
    assert_equal(4.50, @guest3.wallet())
    assert_equal(0.00, @reception.till())
  end

  def test_admit_party_to_room__sufficient_space_and_funds
    @reception.admit_party_to_room("fairytale", @party1)
    assert_equal(3, @room1.number_of_spaces_left())
    assert_equal(40.00, @guest1.wallet())
    assert_equal(10.00, @guest2.wallet())
    assert_equal(20.00, @reception.till())
    assert_equal(@room1, @guest1.in_room())
    assert_equal(@room1, @guest2.in_room())
    assert_equal(0, @reception.occupants().length())
  end

  def test_admit_party_to_room__sufficient_space_and_insufficient_funds
    @guest3.remove_cash(15.50)
    party2 = @party1.push(@guest3)
    @reception.admit_party_to_room("fairytale", party2)
    assert_equal(5, @room1.number_of_spaces_left())
    assert_equal(50.00, @guest1.wallet())
    assert_equal(20.00, @guest2.wallet())
    assert_equal(4.50, @guest3.wallet())
    assert_equal(0.00, @reception.till())
  end

  def test_admit_party_to_room__insufficient_space_and_sufficient_funds
    party2 = @party1.push(@guest3)
    @reception.admit_party_to_room("musical", party2)
    assert_equal(2, @room2.number_of_spaces_left())
    assert_equal(50.00, @guest1.wallet())
    assert_equal(20.00, @guest2.wallet())
    assert_equal(20.00, @guest3.wallet())
    assert_equal(0.00, @reception.till())
  end

end
