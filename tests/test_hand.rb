require "./lib/poker/hand"
require "./lib/poker/card"
require "test/unit"

class TestHand < Test::Unit::TestCase
  def test_hand_creation
    card1 = Card.new(5, 'Spades')
    card2 = Card.new(7, 'Spades')
    hand = Hand.new(card1, card2)
    assert_equal(2, hand.cards.size)
  end

  # TODO: Add more readable of creating card hands
  #def test_card_symbols
    #hand = Hand.new('A♠', '3♠', '5♦', '10♥', '4♥')
    #assert("Spades",hand.cards[0].suit)
    #assert(14, hand.cards[0].number)
  #end
end
