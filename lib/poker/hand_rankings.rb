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

  def self.get_rank(card1, card2, card3, card4, card5)
    if flush?(card1, card2, card3, card4, card5)
      if straight?(card1, card2, card3, card4, card5)
        if hasAce?(card1, card2, card3, card4, card5)
          Rank.new(10, "Royal Flush")
        else
          Rank.new(9, "Straight Flush")
        end
      else
        Rank.new(6, "Flush")
      end
    elsif straight?(card1, card2, card3, card4, card5)
      Rank.new(5, "Straight")
    end
  end

  def self.hasAce?(*cards)
    false
  end

  def self.flush?(card1, card2, card3, card4, card5)
    card1.suit == card2.suit &&
      card2.suit == card3.suit &&
      card3.suit == card4.suit &&
      card4.suit == card5.suit
  end

  def self.straight?(card1, card2, card3, card4, card5)
    card_values = [card1.number, card2.number, card3.number,
                   card4.number, card5.number]

    ordered_card_values = card_values.sort
    # [3,4,5,6,7] => true
    # [1,2,3,6,8] => false
    first_num = ordered_card_values[0]
    ordered_card_values.each_with_index do |val, index|
      if first_num + index != val
        return false
      end
    end
    return true
  end

end
