require("pry")

class Club

  attr_reader(:name, :till, :rooms)

  def initialize(name, array_of_rooms)
    @name = name
    @rooms = array_of_rooms
    @till = 0.0
  end

  def add_cash(amount)
    @till += amount
  end

  def available_rooms(size_of_party)
    return @rooms.find_all {|room| room.number_of_spaces_left() >= size_of_party}
  end

  def admit_customer_to_room(wanted_theme, guest)
    possible_rooms = available_rooms(1)
    wanted_room = possible_rooms.find {|room| room.theme() == wanted_theme}

    wanted_room.add_guest(guest)
    guest.remove_cash(wanted_room.price())
    add_cash(wanted_room.price())
  end

end
