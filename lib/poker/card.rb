class Card

  # display_value (2-10, J, Q, K, A)
  # suit (Spades, Hearts, Clubs, Diamonds)
  # number (2-10, 11, 12, 13, 14)
  #
  attr_reader :number
  attr_reader :suit

  def initialize(number, suit)
    @number = number
    @suit = suit
  end
end
