class Room

  attr_reader(:price, :songs, :occupants)

  def initialize(price)
    @price = price
    @songs = []
    @occupants = []
  end

end
