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

  def sing_along()
    return "hhhmmm, hhhmmm (singing to music in my head)" if @in_room.playing_song() == nil
    @in_room.playing_song().words()
  end

  def enter_club(club)
    club.entrance().add_guest(self)
  end

  def leave_club()
    @in_room.remove_guest(self)
  end

end
