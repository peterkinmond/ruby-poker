require "./lib/poker/hand_rankings"

class TestHandRankings < Test::Unit::TestCase

  def test_royal_flush
    card1 = Card.new(10, 'Spades')
    card2 = Card.new(11, 'Spades')
    card3 = Card.new(12, 'Spades')
    card4 = Card.new(13, 'Spades')
    card5 = Card.new(14, 'Spades')
    rank = HandRankings.get_rank(card1, card2, card3, card4, card5)
    assert_equal(10, rank.value)
    assert_equal("Royal Flush", rank.name)
  end

end
