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

  # TODO: Use more graceful way of schleping cards around
  def self.get_rank(hand)
    if flush?(hand)
      if straight?(hand)
        if hasAce?(hand)
          Rank.new(10, "Royal Flush")
        else
          Rank.new(9, "Straight Flush")
        end
      else
        Rank.new(6, "Flush")
      end
    elsif straight?(hand)
      Rank.new(5, "Straight")
    end
  end

  def self.hasAce?(hand)
    # TODO: Get rid of magic number
    hand.cards.any?{|card| card.number == 14}
  end

  def self.flush?(hand)
    suit = hand.cards[0].suit
    hand.cards.all?{|card| card.suit == suit}
  end

  def self.straight?(hand)
    ordered_card_values = hand.cards.map{|card| card.number}.sort
    first_num = ordered_card_values[0]
    ordered_card_values.each_with_index do |val, index|
      if first_num + index != val
        return false
      end
    end
    return true
  end

end
