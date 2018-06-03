require("pry")

class Club

  attr_reader(:name, :rooms, :entrance)

  def initialize(name, array_of_rooms, entrance)
    @name = name
    @rooms = []
    add_array_of_rooms(array_of_rooms)
    @entrance = entrance
  end

  def add_array_of_rooms(array_of_rooms)
    @rooms.concat(array_of_rooms)
    array_of_rooms.each {|room| room.in_club = self}
  end

  def add_room(room)
    @rooms.push(room)
    room.in_club = self
  end

  def remove_room(wanted_room)
    @rooms.delete(room)
    room.in_club = nil
  end

  def remove_array_of_rooms(array_of_rooms)
    @rooms -= array_of_rooms
    array_of_rooms.each {|room| room.in_club = nil}
  end

  def available_karaoke_rooms(size_of_party)
    return @rooms.find_all {|room| room.number_of_spaces_left() >= size_of_party && room.class() == KaraokeRoom}
  end

  def total_guests()
    return @rooms.sum {|room| room.occupants().length()}
  end

  def empty()
    rooms_with_occupants = @rooms.find_all {|room| room.occupants() != 0}
    rooms_with_occupants.each {|room| room.empty()}
  end

end
