class Room

  attr_reader(:capacity, :occupants, :playing_song)

  def initialize(capacity, playing_song=nil)
    @capacity = capacity
    @occupants = []
    @playing_song = playing_song
  end

  def add_guest(guest)
    @occupants.push(guest)
  end

  def add_party(guests_array)
    @occupants.concat(guests_array)
  end

  def remove_guest(guest)
    @occupants.delete(guest)
  end

  def remove_party(guests_leaving_array)
    @occupants -= guests_leaving_array
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
