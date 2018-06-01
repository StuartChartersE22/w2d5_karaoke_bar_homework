require("minitest/autorun")
require_relative("../guest.rb")
require_relative("../karaoke_room.rb")
require_relative("../song.rb")

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Stuart",50.00)

    song1 = Song.new("Make a man out of you")
    song2 = Song.new("Once upon a December")
    playlist1 = [song1, song2]
    @room1 = KaraokeRoom.new(10.00, 5, "fairytale")
    @room1.add_to_playlist(playlist1)
  end

  def test_guest_has_name
    assert_equal("Stuart", @guest1.name())
  end

  def test_has_money
    assert_equal(50.00, @guest1.wallet())
  end

  def test_remove_money
    @guest1.remove_cash(20.00)
    assert_equal(30.00, @guest1.wallet())
  end

  def test_can_sing_along_to_song__song_is_playing
    @room1.play_selected_song("Make a man out of you")
    words_sung = @guest1.sing_along("Make a man out of you",@room1)
    assert_equal("Words to 'Make a man out of you'", words_sung)
  end

end
