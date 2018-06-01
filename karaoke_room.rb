require("pry")

class KaraokeRoom

  attr_reader(:price, :songs, :occupants, :capacity)
  attr_accessor(:theme)

  def initialize(price, capacity, theme)
    @price = price
    @songs = []
    @occupants = []
    @capacity = capacity
    @theme = theme
  end

  def add_song(song)
    @songs.push(song)
  end

  def add_playlist(songs_array)
    @songs.concat(songs_array)
  end

  def add_guest(guest)
    @occupants.push(guest)
  end

  def add_party(guests_array)
    @occupants.concat(guests_array)
  end

  def remove_guest(guest)
    @occupants.delete(guest)
  end

  def remove_party(guests_leaving_array)
    @occupants -= guests_leaving_array
  end

  def number_of_spaces_left
    return @capacity - @occupants.length()
  end

end
