require("pry")

class Guest

  attr_reader(:name, :wallet)

  def initialize(name, cash)
    @name = name
    @wallet = cash
  end

  def remove_cash(amount)
    @wallet -= amount
  end

end
