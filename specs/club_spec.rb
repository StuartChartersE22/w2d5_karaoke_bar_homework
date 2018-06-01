require("minitest/autorun")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../club.rb")

class ClubTest < MiniTest::Test

  def setup
    @room1 = Room.new(10.00, 5, "fairytale")
    @room2 = Room.new(15.50, 7, "musical")
    rooms = [@room1, @room2]

    @guest1 = Guest.new("Stuart", 50.00)
    @guest2 = Guest.new("Sophie", 20.00)
    @guests1 = [@guest1, @guest2]

    @club1 = Club.new("Da Mic", rooms)
  end

  def test_club_has_name
    assert_equal("Da Mic", @club1.name())
  end

  def test_add_to_till
    @club1.add_cash(10.00)
    assert_equal(10.00, @club1.till())
  end

  def test_available_rooms
    list_available_rooms = @club1.available_rooms(2)
    assert_equal(2, list_available_rooms.length())
  end

  # def test_admit_customer_to_room__sufficient_space_and_funds
  #   @club.admit_customer_to_room("fairytale",@guest1)
  #   assert_equal(4, @room1.number_of_spaces_left())
  #   assert_equal(40.00, @guest1.wallet())
  #   assert_equal(10.00, @club1.till())
  # end

end
