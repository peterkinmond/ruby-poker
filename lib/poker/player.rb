class Player
  attr_reader :name
  attr_reader :cards

  def initialize(name)
    @name = name
    @cards = []
  end

end
