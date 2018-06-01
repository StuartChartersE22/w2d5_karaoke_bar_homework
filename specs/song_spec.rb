require("minitest/autorun")
require_relative("../song.rb")

class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("Make a man out of you")
  end

  def test_song_has_name
    assert_equal("Make a man out of you", @song1.name())
  end

  def test_song_can_play
    assert_equal("'Make a man out of you' is playing", @song1.play())
  end

end
