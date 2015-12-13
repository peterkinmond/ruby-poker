class Player
  attr_reader :name
  attr_reader :cards
  attr_accessor :money
  attr_reader :mood

  def initialize(name)
    @name = name
    @cards = []
    @money = 100
    @mood = "Hopeful"
  end

end
