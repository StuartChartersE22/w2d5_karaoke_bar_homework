class Room

  attr_reader(:price, :songs, :occupants)

  def initialize(price)
    @price = price
    @songs = []
    @occupants = []
  end

  def add_song(song)
    @songs.push(song)
  end

  def add_many_songs(songs_array)
    @songs.concat(songs_array)
  end

  def add_guest(guest)
    @occupants.push(guest)
  end

  def add_many_guests(guests_array)
    @occupants.concat(guests_array)
  end

  def remove_guest(guest)
    @occupants.delete(guest)
  end

  def remove_many_guests(guests_leaving_array)
    @occupants -= guests_leaving_array
  end

end
