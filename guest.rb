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

  def sing_along(room)
    return "hhhmmm, hhhmmm (singing to music in my head)" if room.playing_song() == nil
    room.playing_song().words()
  end

end
