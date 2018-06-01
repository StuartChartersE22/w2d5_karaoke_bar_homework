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

end
