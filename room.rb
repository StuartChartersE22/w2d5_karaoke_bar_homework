class Room

  attr_reader(:capacity, :occupants)

  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

end
