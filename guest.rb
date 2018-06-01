class Guest

  attr_reader(:name, :wallet)

  def initialize(name, cash)
    @name = name
    @wallet = cash
  end

end
