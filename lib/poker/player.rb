class Player
  attr_reader :name
  attr_reader :cards
  attr_accessor :money
  attr_reader :mood
  attr_accessor :hand_ranking

  def initialize(name)
    @name = name
    @cards = []
    @money = 100
    @mood = "Hopeful"
    @hand_ranking = 0
  end

end
