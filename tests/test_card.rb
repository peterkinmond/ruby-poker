require "./lib/poker/card"
require "test/unit"

class TestCard < Test::Unit::TestCase
  def test_card_creation
    card = Card.new(9, 'Spades')
    assert_equal(9, card.number)
    assert_equal('Spades', card.suit)
  end

  def test_card_creation_invalid_number
    assert_raise(Exception) do
      card = Card.new(35, 'Spades')
    end
  end

  def test_card_creation_invalid_suit
    assert_raise(Exception) do
      card = Card.new(9, 'Octogons')
    end
  end
end
