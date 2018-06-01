require("pry")
require_relative("room.rb")

class KaraokeRoom < Room

  attr_reader(:price, :songs)
  attr_accessor(:theme)

  def initialize(price, capacity, theme)
    super(capacity)
    @price = price
    @songs = []
    @theme = theme
  end

  def add_song(song)
    @songs.push(song)
  end

  def add_playlist(songs_array)
    @songs.concat(songs_array)
  end

end
