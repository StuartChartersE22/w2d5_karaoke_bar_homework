require("minitest/autorun")
require_relative("../guest.rb")

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Stuart",50.00)
  end

  def test_guest_has_name
    assert_equal("Stuart", @guest1.name())
  end

  def test_has_money
    assert_equal(50.00, @guest1.wallet())
  end

end
