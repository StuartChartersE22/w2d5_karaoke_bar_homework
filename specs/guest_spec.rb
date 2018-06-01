require("minitest/autorun")
require_relative("../guest.rb")

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Stuart")
  end

  def test_guest_has_name
    assert_equal("Stuart", @guest1.name())
  end

end
