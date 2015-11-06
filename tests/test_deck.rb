require "./lib/poker/deck.rb"
require "test/unit"

class TestDeck < Test::Unit::TestCase
  def test_deckiness
    deck = Deck.new
    assert_equal(52, deck.cards.length)
    assert_equal(2, deck.cards.first.number)
    assert_equal("Spades",   deck.cards.first.suit)
  end

  def test_shuffle
    deck = Deck.new
    assert_equal([2,3,4,5,6,7,8,9,10], deck.cards.map(&:number).slice(0..8))
    deck.shuffle
    assert_not_equal([2,3,4,5,6,7,8,9,10], deck.cards.map(&:number).slice(0..8))
  end
end
