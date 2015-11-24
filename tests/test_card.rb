require "./lib/poker/card"
require "test/unit"

class TestCard < Test::Unit::TestCase
  def test_card_creation
    card = Card.new(9, 'Spade')
    assert_equal(9, card.number)
    assert_equal('Spade', card.suit)
  end

end
