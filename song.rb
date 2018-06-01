require("pry")

class Song

  attr_reader(:name)

  def initialize(name)
    @name = name
  end

  def play()
    return "'#{@name}' is playing"
  end

end
