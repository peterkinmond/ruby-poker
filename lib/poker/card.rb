require './lib/poker/deck'

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
    validate_input
  end

  private
  def validate_input
    if !Deck::NUMBERS.include?(number)
      raise Exception.new("Invalid card number: #{@number}")
    end

    if !Deck::SUITS.include?(@suit)
      raise Exception.new("Invalid card suit: #{@suit}")
    end
  end
end
