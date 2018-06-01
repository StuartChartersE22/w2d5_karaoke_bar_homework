require("pry")

class Guest

  attr_reader(:name, :wallet)
  attr_accessor(:in_room)

  def initialize(name, cash)
    @name = name
    @wallet = cash
    @in_room = nil
  end

  def remove_cash(amount)
    @wallet -= amount
  end

  def sing_along(name_of_song, room)
    room.playing_song().words()
  end

end
