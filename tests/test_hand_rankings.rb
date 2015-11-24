require "./lib/poker/hand_rankings"

class TestHandRankings < Test::Unit::TestCase

  #def test_royal_flush
    #card1 = Card.new(10, 'Spades')
    #card2 = Card.new(11, 'Spades')
    #card3 = Card.new(12, 'Spades')
    #card4 = Card.new(13, 'Spades')
    #card5 = Card.new(14, 'Spades')
    #rank = HandRankings.get_rank(card1, card2, card3, card4, card5)
    #assert_equal(10, rank.value)
    #assert_equal("Royal Flush", rank.name)
  #end

  #def test_straight_flush
    #card1 = Card.new(4, 'Spades')
    #card2 = Card.new(5, 'Spades')
    #card3 = Card.new(6, 'Spades')
    #card4 = Card.new(7, 'Spades')
    #card5 = Card.new(8, 'Spades')
    #rank = HandRankings.get_rank(card1, card2, card3, card4, card5)
    #assert_equal(9, rank.value)
    #assert_equal("Straight Flush", rank.name)
  #end

  def test_flush
    card1 = Card.new(9, 'Spades')
    card2 = Card.new(5, 'Spades')
    card3 = Card.new(2, 'Spades')
    card4 = Card.new(11, 'Spades')
    card5 = Card.new(14, 'Spades')
    rank = HandRankings.get_rank(card1, card2, card3, card4, card5)
    assert_equal(6, rank.value)
    assert_equal("Flush", rank.name)
  end

  def test_straight
    card1 = Card.new(3, 'Spades')
    card2 = Card.new(4, 'Hearts')
    card3 = Card.new(5, 'Diamonds')
    card4 = Card.new(6, 'Clubs')
    card5 = Card.new(7, 'Spades')
    rank = HandRankings.get_rank(card1, card2, card3, card4, card5)
    assert_equal(5, rank.value)
    assert_equal("Straight", rank.name)
  end

end
