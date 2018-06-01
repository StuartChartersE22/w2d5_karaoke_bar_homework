class Club

  attr_reader(:name, :till)

  def initialize(name, array_of_rooms)
    @name = name
    @rooms = array_of_rooms
    @till = 0.0
  end

  def add_cash(amount)
    @till += amount
  end

end
