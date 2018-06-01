require("minitest/autorun")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../club.rb")

class ClubTest < MiniTest::Test

  def setup
    @room1 = Room.new(10.00)
    @room2 = Room.new(15.50)
    @rooms = [@room1, @room2]

    @guest1 = Guest.new("Stuart", 50.00)
    @guest2 = Guest.new("Sophie", 20.00)
    @guests1 = [@guest1, @guest2]

    @club1 = Club.new("Da Mic", @rooms)
  end

  def test_club_has_name
    assert_equal("Da Mic", @club1.name())
  end

  def test_add_to_till
    @club1.add_cash(10.00)
    assert_equal(10.00, @club1.till())
  end

end
