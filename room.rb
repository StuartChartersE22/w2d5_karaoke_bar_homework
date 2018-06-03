class Room

  attr_reader(:capacity, :occupants, :playing_song, :in_club)

  def initialize(capacity, playing_song=nil)
    @capacity = capacity
    @occupants = []
    @playing_song = playing_song
    @in_club = nil
  end

  def assign_room_to_club(club)
    @in_club = club
  end

  def add_guest(guest)
    @occupants.push(guest)
    guest.in_room = self
  end

  def add_party(guests_array)
    @occupants.concat(guests_array)
    guests_array.each {|guest| guest.in_room = self}
  end

  def remove_guest(guest)
    @occupants.delete(guest)
    guest.in_room = nil
  end

  def remove_party(guests_leaving_array)
    @occupants -= guests_leaving_array
    guests_leaving_array.each {|guest| guest.in_room = nil}
  end

  def number_of_spaces_left()
    return @capacity - @occupants.length()
  end

  def turn_off_music()
    @playing_song = nil
  end

  def turn_on_music(song)
    @playing_song = song
  end

end
