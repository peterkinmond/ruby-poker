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

  def self.get_rank(hand)
    if royal_flush?(hand)
      Rank.new(10, "Royal Flush")
    elsif straight_flush?(hand)
      Rank.new(9, "Straight Flush")
    elsif four_of_a_kind?(hand)
      Rank.new(8, "Four of a Kind")
    #elsif full_house?(hand)
      #Rank.new(7, "Full House")
    elsif flush?(hand)
      Rank.new(6, "Flush")
    elsif straight?(hand)
      Rank.new(5, "Straight")
    #elsif three_of_a_kind?(hand)
      #Rank.new(4, "Three of a Kind")
    #elsif two_pair?(hand)
      #Rank.new(3, "Two Pair")
    #elsif one_pair?(hand)
      #Rank.new(2, "One Pair")
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
    ordered_card_values = hand.cards.map{|card| card.number}.sort

    card_count = {}
    ordered_card_values.each do |val|
      if card_count.has_key?(val)
        card_count[val] += 1
        return true if card_count[val] == 4
      else
        card_count[val] = 1
      end
    end
    return false
  end

  def self.has_ace?(hand)
    # TODO: Get rid of magic number
    hand.cards.any?{|card| card.number == 14}
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

end
