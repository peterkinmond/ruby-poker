require "./lib/poker/hand"

class HandRankings

  Rank = Struct.new(:value, :name)

  # 10 Royal Flush
  # 9  Straight Flush
  # 8  Four of a Kind
  # 7  Full House
  # 6  Flush
  # 5  Straight
  # 4  Three of a Kind
  # 3  Two Pair
  # 2  One Pair
  # 1  High Card

  def self.get_rank_for_best_5(*cards)
    highest_ranking = Rank.new(1, "High Card")
    cards.combination(5).each do |combo|
      combo_ranking = HandRankings.get_rank(Hand.new(*combo))
      if combo_ranking.value > highest_ranking.value
        highest_ranking = combo_ranking
      end
    end
    highest_ranking
  end

  def self.get_rank(hand)
    # TODO: Track pair value, not just amount of pairs
    if royal_flush?(hand)
      Rank.new(10, "Royal Flush")
    elsif straight_flush?(hand)
      Rank.new(9, "Straight Flush")
    elsif four_of_a_kind?(hand)
      Rank.new(8, "Four of a Kind")
    elsif full_house?(hand)
      Rank.new(7, "Full House")
    elsif flush?(hand)
      Rank.new(6, "Flush")
    elsif straight?(hand)
      Rank.new(5, "Straight")
    elsif three_of_a_kind?(hand)
      Rank.new(4, "Three of a Kind")
    elsif two_pair?(hand)
      Rank.new(3, "Two Pair")
    elsif one_pair?(hand)
      Rank.new(2, "One Pair")
    else
      Rank.new(1, "High Card")
    end
  end

  def self.royal_flush?(hand)
    flush?(hand) && straight?(hand) && has_ace?(hand)
  end

  def self.straight_flush?(hand)
    flush?(hand) && straight?(hand)
  end

  def self.four_of_a_kind?(hand)
    card_count = get_multiples(hand)
    card_count.values.sort == [1, 4]
  end

  def self.full_house?(hand)
    card_count = get_multiples(hand)
    # Full House needs 3 of a kind and a pair
    card_count.values.sort == [2, 3]
  end

  def self.flush?(hand)
    suit = hand.cards.first.suit
    hand.cards.all?{|card| card.suit == suit}
  end

  def self.straight?(hand)
    ordered_card_values = hand.cards.map{|card| card.number}.sort
    first_num = ordered_card_values.first
    ordered_card_values.each_with_index do |val, index|
      if first_num + index != val
        return false
      end
    end
    return true
  end

  def self.three_of_a_kind?(hand)
    card_count = get_multiples(hand)
    card_count.values.sort == [1, 1, 3]
  end

  def self.two_pair?(hand)
    card_count = get_multiples(hand)
    card_count.values.sort == [1, 2, 2]
  end

  def self.one_pair?(hand)
    card_count = get_multiples(hand)
    card_count.values.sort == [1, 1, 1, 2]
  end

  def self.get_multiples(hand)
    values = hand.cards.map{|card| card.number}
    card_count = {}
    values.each do |val|
      if card_count.has_key?(val)
        card_count[val] += 1
      else
        card_count[val] = 1
      end
    end
    card_count
  end

  def self.has_ace?(hand)
    # TODO: Get rid of magic number
    hand.cards.any?{|card| card.number == 14}
  end

end
