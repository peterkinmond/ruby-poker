require "./lib/poker/hand_rankings"
require "./lib/poker/card"
require "test/unit"

class TestHandRankings < Test::Unit::TestCase

  def test_royal_flush
    card1 = Card.new(10, 'Spades')
    card2 = Card.new(11, 'Spades')
    card3 = Card.new(12, 'Spades')
    card4 = Card.new(13, 'Spades')
    card5 = Card.new(14, 'Spades')
    hand = Hand.new(card1, card2, card3, card4, card5)
    rank = HandRankings.get_rank(hand)
    assert_equal(10, rank.value)
    assert_equal("Royal Flush", rank.name)
  end

  def test_straight_flush
    card1 = Card.new(4, 'Spades')
    card2 = Card.new(5, 'Spades')
    card3 = Card.new(6, 'Spades')
    card4 = Card.new(7, 'Spades')
    card5 = Card.new(8, 'Spades')
    hand = Hand.new(card1, card2, card3, card4, card5)
    rank = HandRankings.get_rank(hand)
    assert_equal(9, rank.value)
    assert_equal("Straight Flush", rank.name)
  end

  def test_four_of_a_kind
    card1 = Card.new(5, 'Hearts')
    card2 = Card.new(5, 'Diamonds')
    card3 = Card.new(5, 'Clubs')
    card4 = Card.new(5, 'Spades')
    card5 = Card.new(8, 'Spades')
    hand = Hand.new(card1, card2, card3, card4, card5)
    rank = HandRankings.get_rank(hand)
    assert_equal(8, rank.value)
    assert_equal("Four of a Kind", rank.name)
  end

  def test_full_house
    card1 = Card.new(5, 'Hearts')
    card2 = Card.new(5, 'Diamonds')
    card3 = Card.new(5, 'Clubs')
    card4 = Card.new(8, 'Hearts')
    card5 = Card.new(8, 'Spades')
    hand = Hand.new(card1, card2, card3, card4, card5)
    rank = HandRankings.get_rank(hand)
    assert_equal(7, rank.value)
    assert_equal("Full House", rank.name)
  end

  def test_flush
    card1 = Card.new(9, 'Spades')
    card2 = Card.new(5, 'Spades')
    card3 = Card.new(2, 'Spades')
    card4 = Card.new(11, 'Spades')
    card5 = Card.new(14, 'Spades')
    hand = Hand.new(card1, card2, card3, card4, card5)
    rank = HandRankings.get_rank(hand)
    assert_equal(6, rank.value)
    assert_equal("Flush", rank.name)
  end

  def test_straight
    card1 = Card.new(3, 'Spades')
    card2 = Card.new(4, 'Hearts')
    card3 = Card.new(5, 'Diamonds')
    card4 = Card.new(6, 'Clubs')
    card5 = Card.new(7, 'Spades')
    hand = Hand.new(card1, card2, card3, card4, card5)
    rank = HandRankings.get_rank(hand)
    assert_equal(5, rank.value)
    assert_equal("Straight", rank.name)
  end

  def test_three_of_a_kind
    card1 = Card.new(5, 'Hearts')
    card2 = Card.new(5, 'Diamonds')
    card3 = Card.new(5, 'Clubs')
    card4 = Card.new(9, 'Spades')
    card5 = Card.new(8, 'Spades')
    hand = Hand.new(card1, card2, card3, card4, card5)
    rank = HandRankings.get_rank(hand)
    assert_equal(4, rank.value)
    assert_equal("Three of a Kind", rank.name)
  end

  def test_two_pair
    card1 = Card.new(5, 'Hearts')
    card2 = Card.new(5, 'Diamonds')
    card3 = Card.new(7, 'Clubs')
    card4 = Card.new(8, 'Hearts')
    card5 = Card.new(8, 'Spades')
    hand = Hand.new(card1, card2, card3, card4, card5)
    rank = HandRankings.get_rank(hand)
    assert_equal(3, rank.value)
    assert_equal("Two Pair", rank.name)
  end

  def test_one_pair
    card1 = Card.new(2, 'Hearts')
    card2 = Card.new(5, 'Diamonds')
    card3 = Card.new(7, 'Clubs')
    card4 = Card.new(8, 'Hearts')
    card5 = Card.new(8, 'Spades')
    hand = Hand.new(card1, card2, card3, card4, card5)
    rank = HandRankings.get_rank(hand)
    assert_equal(2, rank.value)
    assert_equal("One Pair", rank.name)
  end

  def test_high_card
    card1 = Card.new(2, 'Spades')
    card2 = Card.new(5, 'Hearts')
    card3 = Card.new(7, 'Diamonds')
    card4 = Card.new(9, 'Clubs')
    card5 = Card.new(10, 'Spades')
    hand = Hand.new(card1, card2, card3, card4, card5)
    rank = HandRankings.get_rank(hand)
    assert_equal(1, rank.value)
    assert_equal("High Card", rank.name)
  end

end
