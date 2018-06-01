require("pry")

class Song

  attr_reader(:name, :words)

  def initialize(name)
    @name = name
    @words = "Words to '#{name}'"
  end

  def play()
    return "'#{@name}' is playing"
  end

end
