require("minitest/autorun")
require_relative("../karaoke_room.rb")
require_relative("../guest.rb")
require_relative("../club.rb")
require_relative("../reception.rb")
require_relative("../song.rb")

class GuestTest < MiniTest::Test

  def setup
    @room1 = KaraokeRoom.new(10.00, 5, "fairytale")
    @room2 = KaraokeRoom.new(15.50, 2, "musical")
    @reception = Reception.new()
    rooms = [@room1, @room2, @reception]

    @club1 = Club.new("Da Mic", rooms, @reception)

    @guest1 = Guest.new("Stuart",50.00)

    song1 = Song.new("Make a man out of you")
    song2 = Song.new("Once upon a December")
    playlist1 = [song1, song2]
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
    @room1.add_guest(@guest1)
    @room1.play_selected_song("Make a man out of you")
    words_sung = @guest1.sing_along()
    assert_equal("Words to 'Make a man out of you'", words_sung)
  end

  def test_can_sing_along_to_song__no_song_playing
    @room1.add_guest(@guest1)
    words_sung = @guest1.sing_along()
    assert_equal("hhhmmm, hhhmmm (singing to music in my head)", words_sung)
  end

  def test_enter_club
    @guest1.enter_club(@club1)
    assert_equal(@reception, @guest1.in_room())
  end

end
