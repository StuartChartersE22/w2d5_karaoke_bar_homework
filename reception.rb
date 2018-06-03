require("pry")
require_relative("room.rb")

class Reception < Room

  attr_reader(:till)

  def initialize(background_music=nil)
    super(30, background_music)
    @till = 0.0
  end

  def add_cash(amount)
    @till += amount
  end

  def admit_guest_to_room(wanted_theme, guest)
    possible_rooms = @in_club.available_karaoke_rooms(1)

    return if possible_rooms.length() == 0

    wanted_room = possible_rooms.find {|room| room.theme() == wanted_theme}

    return if wanted_room == nil || guest.wallet() < wanted_room.price()

    wanted_room.add_guest(guest)
    guest.remove_cash(wanted_room.price())
    add_cash(wanted_room.price())
    guest.in_room = wanted_room
    @occupants.delete(guest)
  end

  def admit_party_to_room(wanted_theme, array_of_guests)
    possible_rooms = @in_club.available_karaoke_rooms(array_of_guests.length())

    return if possible_rooms.length() == 0
    
    wanted_room = possible_rooms.find {|room| room.theme() == wanted_theme}

    return if wanted_room == nil || array_of_guests.any? {|guest| guest.wallet() < wanted_room.price()}

    wanted_room.add_party(array_of_guests)
    array_of_guests.each {|guest| guest.remove_cash(wanted_room.price())}
    add_cash(wanted_room.price() * array_of_guests.length())
    array_of_guests.each {|guest| guest.in_room = wanted_room}
    @occupants -= array_of_guests
  end

end
