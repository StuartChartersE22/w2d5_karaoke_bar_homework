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

  def add_to_playlist(songs_array)
    @songs.concat(songs_array)
  end

  def play_selected_song(name_of_song)
    wanted_song = @songs.find {|song| song.name() == name_of_song}
    wanted_song.play()
  end

end
