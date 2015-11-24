class Hand
  # Hand is made up of 2 hole cards
  # and 5 community cards
  # Include them in this class or add to player?

  attr_reader :cards

  def initialize(*cards)
    @cards = cards
  end
end
