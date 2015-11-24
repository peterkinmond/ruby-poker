require "./lib/poker/hand"
require "./lib/poker/card"
require "test/unit"

class TestHand < Test::Unit::TestCase
  def test_hand_creation
    card1 = Card.new(5, 'Spade')
    card2 = Card.new(7, 'Spade')
    hand = Hand.new(card1, card2)
    assert_equal(2, hand.cards.size)
  end
end
